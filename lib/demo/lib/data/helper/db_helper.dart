import 'package:buoi_04/demo/lib/data/model/category.dart';
import 'package:buoi_04/demo/lib/data/model/product.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DatabaseHelper {
  // Singleton pattern
  static final DatabaseHelper _databaseService = DatabaseHelper._internal();
  factory DatabaseHelper() => _databaseService;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    if (_database == null) {
      throw Exception("Lỗi khởi tạo database");
    }

    return _database!;
  }

  Future<Database> _initDatabase() async {
    if (kIsWeb) {
      // Nếu chạy trên web, dùng databaseFactoryFfiWeb
      // return await databaseFactoryFfiWeb.openDatabase('db_product_web.db');
      var factory = databaseFactory;
      if (identical(0, 0.0)) {
        // Kiểm tra nếu chạy trên Web
        factory = databaseFactoryFfiWeb;
      }

      final path = join(await getDatabasesPath(), 'db_product_web.db');
      return await factory.openDatabase(
        path,
        options: OpenDatabaseOptions(
          version: 2, // Đảm bảo tăng version để cập nhật schema
          onCreate: _onCreate,
        ),
      );
    } else {
      // Nếu chạy trên Android/iOS, dùng SQLite bình thường
      final databasePath = await getDatabasesPath();

      final path = join(databasePath, 'db_product.db');
      print("Đường dẫn database: $databasePath");
      // in đường dẫn chứa file database

      return await openDatabase(path, version: 1, onCreate: _onCreate);
    }
  }
  // Future<Database> _initDatabase() async {
  //   final databasePath = await getDatabasesPath();

  //   final path = join(databasePath, 'db_product.db');
  //   print("Đường dẫn database: $databasePath"); // in đường dẫn chứa file database
  //   return await openDatabase(path, onCreate: _onCreate, version: 1);
  // }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE category(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, desc TEXT);',
    );
    await db.execute(
      'CREATE TABLE product(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price INTEGER, img TEXT, desc TEXT, catid INTEGER);',
    );
  }

// CRUD dành cho Category
  Future<void> insertCategory(CategoryModel categoryModel) async {
    final db = await database;
    await db.insert(
      'category',
      categoryModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CategoryModel>> categories() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('category');

    // Tránh trả về null
    if (maps.isEmpty) {
      return [];
    }

    return maps.map((e) => CategoryModel.fromMap(e)).toList();
  }

  Future<CategoryModel> category(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('category', where: 'id = ?', whereArgs: [id]);
    return CategoryModel.fromMap(maps[0]);
  }

  Future<void> updateCategory(CategoryModel cate) async {
    final db = await database;
    await db.update(
      'category',
      cate.toMap(),
      where: 'id = ?',
      whereArgs: [cate.id],
    );
  }

  Future<void> deleteCategory(int id) async {
    final db = await database;
    await db.delete(
      'category',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Tiếp tục làm CRUD cho Product

  Future<List<Product_Model>> products() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('product');

    // Tránh trả về null
    if (maps.isEmpty) {
      return [];
    }

    return maps.map((e) => Product_Model.fromMap(e)).toList();
  }

  Future<Product_Model> product(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('product', where: 'id = ?', whereArgs: [id]);
    return Product_Model.fromMap(maps[0]);
  }

  Future<void> insertProduct(Product_Model productModel) async {
    final db = await database;
    await db.insert(
      'product',
      productModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateProduct(Product_Model prod) async {
    final db = await database;
    await db.update(
      'product',
      prod.toMap(),
      where: 'id = ?',
      whereArgs: [prod.id],
    );
  }

  Future<void> deleteProduct(int id) async {
    final db = await database;
    await db.delete(
      'product',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

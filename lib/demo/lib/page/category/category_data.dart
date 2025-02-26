import 'package:flutter/material.dart';
import '../../data/model/category.dart';
import '../../data/helper/db_helper.dart';

import 'category_add.dart';

class CategoryBuilder extends StatefulWidget {
  const CategoryBuilder({
    super.key,
  });

  @override
  State<CategoryBuilder> createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  late Stream<List<CategoryModel>> _categoryStream;

  Future<List<CategoryModel>> _getCategorys() async {
    // thêm vào 1 dòng dữ liệu nếu getdata không có hoặc chưa có database
    return await _databaseHelper.categories();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryStream = Stream.periodic(
      const Duration(seconds: 1), // Cập nhật mỗi giây (hoặc khi có sự kiện)
      (_) => _databaseHelper.categories(),
    ).asyncMap((event) => event);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CategoryModel>>(
      stream: _categoryStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          print("Lỗi: ${snapshot.error}");
          return Text("Lỗi: ${snapshot.error}");
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Text("Không có dữ liệu");
        } else {
          final categories = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final itemCat = categories[index];
                return _buildCategory(itemCat, context);
              },
            ),
          );
        }
      },
    );
  }

  Widget _buildCategory(CategoryModel breed, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              alignment: Alignment.center,
              child: Text(
                breed.id.toString(),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    breed.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(breed.desc),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    DatabaseHelper().deleteCategory(breed.id!);
                  });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (_) => CategoryAdd(
                              isUpdate: true,
                              categoryModel: breed,
                            ),
                            fullscreenDialog: true,
                          ),
                        )
                        .then((_) => setState(() {}));
                  });
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.yellow.shade800,
                ))
          ],
        ),
      ),
    );
  }
}

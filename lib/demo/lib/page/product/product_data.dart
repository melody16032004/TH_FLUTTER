import 'package:buoi_04/demo/lib/data/helper/db_helper.dart';
import 'package:buoi_04/demo/lib/data/model/product.dart';
import 'package:buoi_04/demo/lib/page/product/product_add.dart';
import 'package:flutter/material.dart';

class ProductBuilder extends StatefulWidget {
  const ProductBuilder({super.key});

  @override
  State<ProductBuilder> createState() => _ProductBuilderState();
}

class _ProductBuilderState extends State<ProductBuilder> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  late Stream<List<Product_Model>> _productStream;

  Future<List<Product_Model>> _getProducts() async {
    // thêm vào 1 dòng dữ liệu nếu getdata không có hoặc chưa có database
    return await _databaseHelper.products();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productStream = Stream.periodic(
      const Duration(seconds: 1), // Cập nhật mỗi giây (hoặc khi có sự kiện)
      (_) => _databaseHelper.products(),
    ).asyncMap((event) => event);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product_Model>>(
      stream: _productStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          print("Lỗi: ${snapshot.error}");
          return Text("Lỗi: ${snapshot.error}");
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Text("Không có dữ liệu");
        } else {
          final products = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final itemProd = products[index];
                return _buildProduct(itemProd, context);
              },
            ),
          );
        }
      },
    );
  }

  Widget _buildProduct(Product_Model breed, BuildContext context) {
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
                    breed.name!,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(breed.des!),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    DatabaseHelper().deleteProduct(breed.id!);
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
                            builder: (_) => ProductAdd(
                              isUpdate: true,
                              productModel: breed,
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

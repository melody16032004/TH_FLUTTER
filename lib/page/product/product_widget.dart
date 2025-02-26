import 'package:buoi_04/data/model/category_model.dart';
import 'package:buoi_04/data/model/product_model.dart';
import 'package:buoi_04/data/provider/product_provider.dart';
import 'package:buoi_04/page/product/product_body.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  final CategoryModel? objCat;
  const ProductWidget({super.key, this.objCat});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  List<ProductModel> lstProduct = [];

  Future<void> loadAllProdList() async {
    lstProduct = await ReadData().loadData();
    setState(() {}); // Cập nhật UI
  }

  Future<void> loadProdList(int catId) async {
    lstProduct = await ReadData().loadDataByCate(catId) as List<ProductModel>;
    setState(() {}); // Cập nhật UI
  }

  @override
  void initState() {
    super.initState();
    if (widget.objCat != null) {
      loadProdList(widget.objCat!.id!);
    } else {
      loadAllProdList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.objCat != null
          ? AppBar(
              title: Text('Product list ${widget.objCat!.name!.toUpperCase()}'))
          : null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: lstProduct.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                itemCount: lstProduct.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return itemGridView(lstProduct[index]);
                },
              ),
      ),
    );
  }
}

import 'package:buoi_04/data/model/category_model.dart';
import 'package:buoi_04/data/model/realme_model.dart';
import 'package:buoi_04/data/provider/realme_provider.dart';
import 'package:buoi_04/page/product/realme_body.dart';
import 'package:flutter/material.dart';

class RealmeWidget extends StatefulWidget {
  final CategoryModel? objCat;
  const RealmeWidget({super.key, this.objCat});

  @override
  State<RealmeWidget> createState() => _RealmeWidgetState();
}

class _RealmeWidgetState extends State<RealmeWidget> {
  List<RealmeModel> lstProduct = [];

  Future<void> loadAllProdList() async {
    lstProduct = await ReadData().loadData();
    setState(() {}); // Cập nhật UI
  }

  Future<void> loadProdList(int catId) async {
    lstProduct = await ReadData().loadDataByCate(catId) as List<RealmeModel>;
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
                  return itemGridView(
                    realmeModel: lstProduct[index],
                  );
                },
              ),
      ),
    );
  }
}

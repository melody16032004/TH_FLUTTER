import 'package:buoi_04/config/const.dart';
import 'package:buoi_04/data/model/category_model.dart';
import 'package:buoi_04/data/provider/category_provider.dart';
import 'package:buoi_04/page/category/category_body.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<CategoryModel> lstCate = [];
  List<String> brands = [
    "IPHONE",
    "SAMSUNG",
    "OPPO",
    "XIAOMI",
    "NOKIA",
    "REALME",
    "VIVO",
    "MASSTEL"
  ];
  Future<String> loadCateList() async {
    lstCate = await ReadData().loadData();
    return '';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCateList();
    // print(loadCateList());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadCateList(),
      builder: (context, snapshot) {
        return Center(
          child: Column(
            children: [
              Text(
                'Category List',
                style: titleStyle,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: lstCate.length,
                itemBuilder: (context, index) {
                  return itemCateView(context, lstCate[index]);
                },
              ))
            ],
          ),
        );
      },
    );
  }
}

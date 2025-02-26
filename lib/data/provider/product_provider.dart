import 'dart:convert';

import 'package:buoi_04/data/model/product_model.dart';
import 'package:flutter/services.dart';

class ReadData {
  Future<List<ProductModel>> loadData() async {
    var data = await rootBundle.loadString("assets/files/productlist.json");
    var dataJson = jsonDecode(data);

    return (dataJson['data'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<Iterable<ProductModel>> loadDataByCate(int cateId) async {
    var data = await rootBundle.loadString("assets/files/productlist.json");
    var dataJson = jsonDecode(data);

    return (dataJson['data'] as List)
        .map((e) => ProductModel.fromJson(e))
        .where((e) => e.cateId == cateId)
        .toList();
  }
}

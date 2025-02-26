import 'dart:convert';

import 'package:buoi_04/data/model/category_model.dart';
import 'package:flutter/services.dart';

class ReadData {
  Future<List<CategoryModel>> loadData() async {
    var data = await rootBundle.loadString("assets/files/categorylist.json");
    var dataJson = jsonDecode(data);

    return (dataJson['data'] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }
}

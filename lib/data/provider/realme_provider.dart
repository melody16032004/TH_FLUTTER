import 'dart:convert';

import 'package:buoi_04/data/model/realme_model.dart';
import 'package:flutter/services.dart';

class ReadData {
  Future<List<RealmeModel>> loadData() async {
    var data = await rootBundle.loadString("assets/files/realme.json");
    var dataJson = jsonDecode(data);

    return (dataJson['realme'] as List)
        .map((e) => RealmeModel.fromJson(e))
        .toList();
  }

  Future<Iterable<RealmeModel>> loadDataByCate(int cateId) async {
    var data = await rootBundle.loadString("assets/files/realme.json");
    var dataJson = jsonDecode(data);

    return (dataJson['realme'] as List)
        .map((e) => RealmeModel.fromJson(e))
        .where((e) => e.cateId == cateId)
        .toList();
  }
}

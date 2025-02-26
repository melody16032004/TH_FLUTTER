import 'package:buoi_04/data/model/demo/user.dart';
import 'package:buoi_04/data/model/product_model.dart';
import 'package:flutter/widgets.dart';

class ProductsVM with ChangeNotifier {
  List<ProductModel> lst = [];

  add(ProductModel mo) {
    lst.add(mo);
    notifyListeners();
  }

  del(int index) {
    lst.removeAt(index);
    notifyListeners();
  }

  User user = User();

  submit(User u) {
    user.fullname = u.fullname;
    user.email = u.email;
    user.gender = u.gender;
    user.favourite = u.favourite;
    notifyListeners();
  }
}

import 'package:buoi_04/config/const.dart';
import 'package:buoi_04/data/model/category_model.dart';
import 'package:buoi_04/page/product/product_widget.dart';
import 'package:buoi_04/page/product/realme_widget.dart';
import 'package:flutter/material.dart';

Widget itemCateView(BuildContext context, CategoryModel itemCate) {
  return InkWell(
    onTap: () {
      print(itemCate.id);
      if (itemCate.id == 6) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RealmeWidget(objCat: itemCate),
            ));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductWidget(objCat: itemCate),
            ));
      }
    },
    child: Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 139, 171, 231),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Container(
        width: 90,
        height: 60,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        child: Image.asset(
          urlImg + itemCate.img!,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

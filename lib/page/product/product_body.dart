import 'package:buoi_04/config/const.dart';
import 'package:buoi_04/data/model/product_model.dart';
import 'package:buoi_04/data/model/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

Widget itemGridView(ProductModel productModel) {
  return Container(
    margin: const EdgeInsets.all(4),
// padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      border: Border.all(
        color: Colors.lightBlue,
        width: 1.5,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset(
            urlProductImg + productModel.img!,
            height: 100,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image),
          ),
        ),
        Text(
          productModel.name ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          NumberFormat('###,###.###').format(productModel.price),
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
          selectionColor: const Color.fromARGB(255, 0, 0, 1),
        ),
        Consumer<ProductsVM>(
          builder: (context, value, child) => ElevatedButton.icon(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 24,
            ),
            label: const Text('Add'),
            onPressed: () {
              value.add(productModel);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

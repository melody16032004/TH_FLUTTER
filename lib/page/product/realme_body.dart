import 'package:buoi_04/config/const.dart';
import 'package:buoi_04/data/model/realme_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget itemGridView({required RealmeModel realmeModel}) {
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
            urlRealmeImg + realmeModel.img!,
            height: 100,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image),
          ),
        ),
        Text(
          realmeModel.name ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          "${NumberFormat('###,###.###').format(realmeModel.price)}VND",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
          selectionColor: const Color.fromARGB(255, 0, 0, 1),
        ),
      ],
    ),
  );
}

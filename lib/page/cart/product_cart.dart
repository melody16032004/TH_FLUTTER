import 'package:buoi_04/config/const.dart';
import 'package:buoi_04/data/model/product_model.dart';
import 'package:buoi_04/data/model/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({super.key});

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  var lstProStr = "";
  List<ProductModel> itemsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Consumer<ProductsVM>(
            builder: (context, value, child) => Scaffold(
              body: SafeArea(
                child: Scaffold(
                  body: value.lst.isEmpty
                      ? const Center(
                          child: Text('No product in cart now!'),
                        )
                      : ListView.builder(
                          itemCount: value.lst.length,
                          itemBuilder: (context, index) {
                            return itemListView(value.lst[index], value, index);
                          },
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget itemListView(ProductModel productModel, ProductsVM value, int index) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                urlProductImg + productModel.img!,
                height: 80,
                width: 80,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image),
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.name ?? '',
                    style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold,
                      //
                    ),
                  ),
                  Text(
                    NumberFormat('###,###.###').format(productModel.price),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      //
                    ),
                  ),
                  Text(
                    productModel.des!,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton.outlined(
                color: Colors.black,
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    minimumSize: WidgetStatePropertyAll(Size(40, 40))),

                onPressed: () {
                  value.del(index);
                },
                icon: const Icon(
                  Icons.delete_rounded,
                  color: Colors.black,
                  size: 20,
                  //
                ),
                //
              )
            ],
          ),
        ],
      ),
    );
  }
}

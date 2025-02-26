import 'package:buoi_04/data/model/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        color: Colors.grey.shade200,
        //
      ),
      child: Consumer<ProductsVM>(
        builder: (context, value, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            infoDetail(
                context: context,
                title: 'Name',
                detail: value.user.fullname ?? '<Unknown>'),
            infoDetail(
                context: context,
                title: 'Email',
                detail: value.user.email ?? '<Unknown>'),
            infoDetail(
                context: context,
                title: 'Gender',
                detail: value.user.gender ?? '<Unknown>'),
            infoDetail(
                context: context,
                title: 'Favourite',
                detail: value.user.favourite ?? '<Unknown>'),
          ],
        ),
      ),
    );
  }

  Widget infoDetail(
      {required BuildContext context,
      required String title,
      required String detail}) {
    final widthDevice = MediaQuery.of(context).size.width;
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$title:   ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade500,
                fontSize: 15
                //
                ),
            //
          ),
          Text(
            detail,
          ),
        ],
      ),
    );
  }
}

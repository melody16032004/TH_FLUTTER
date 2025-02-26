import 'package:buoi_04/demo/lib/data/helper/db_helper.dart';
import 'package:flutter/material.dart';
import '../../data/model/product.dart';

class ProductAdd extends StatefulWidget {
  final bool isUpdate;
  final Product_Model? productModel;
  const ProductAdd({super.key, this.isUpdate = false, this.productModel});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String titleText = "";
  final DatabaseHelper _databaseService = DatabaseHelper();

  Future<void> _onSave() async {
    final name = _nameController.text;
    final description = _descController.text;
    final price = _priceController.text;

    await _databaseService.insertProduct(
        Product_Model(name: name, des: description, price: int.parse(price)));
    setState(() {});
    Navigator.pop(context);
  }

  Future<void> _onUpdate() async {
    final name = _nameController.text;
    final description = _descController.text;
    final price = _priceController.text;

    await _databaseService.updateProduct(Product_Model(
        name: name,
        des: description,
        price: int.parse(price),
        id: widget.productModel!.id));

    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.productModel != null && widget.isUpdate) {
      _nameController.text = widget.productModel!.name!;
      _descController.text = widget.productModel!.des!;
    }
    if (widget.isUpdate) {
      titleText = "Update Product";
    } else {
      titleText = "Add New Product";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter name',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter price',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descController,
              maxLines: 7,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter description',
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 45.0,
              child: ElevatedButton(
                onPressed: () {
                  widget.isUpdate ? _onUpdate() : _onSave();
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

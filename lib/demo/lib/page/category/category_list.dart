import 'package:flutter/material.dart';
import 'category_add.dart';
import 'category_data.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // get list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Category List",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent.shade700,
      ),
      body: const Center(child: CategoryBuilder()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (_) => const CategoryAdd(),
                  fullscreenDialog: true,
                ),
              )
              .then((_) => setState(() {}));
        },
        tooltip: 'Add New',
        child: const Icon(Icons.add),
      ),
    );
  }
}

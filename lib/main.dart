// Các tuần còn lại

import 'package:buoi_04/data/model/product_viewmodel.dart';
import 'package:buoi_04/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsVM(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

// Tuần 6 (SQL)
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import 'package:buoi_04/demo/lib/mainpage.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

// void main() {
//   if (kIsWeb) {
//     databaseFactory = databaseFactoryFfiWeb;
//   }
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//         debugShowCheckedModeBanner: false, home: Mainpage());
//   }
// }

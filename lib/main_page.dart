import 'package:buoi_04/data/model/cartcounter.dart';
import 'package:buoi_04/data/model/category_model.dart';
import 'package:buoi_04/data/model/product_viewmodel.dart';
import 'package:buoi_04/page/cart/product_cart.dart';
import 'package:buoi_04/page/category/category_widget.dart';
import 'package:buoi_04/page/home_widget.dart';
import 'package:buoi_04/page/product/product_widget.dart';
import 'package:buoi_04/page/register/info.dart';
import 'package:buoi_04/page/register/register.dart';
import 'package:buoi_04/test/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  int currentIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<CategoryModel> lstCate = [];
  static final List<Widget> _widgetOptions = [
    const HomeWidget(),
    const CategoryWidget(),
    const ProductWidget(),
    const ProductCart(),
    const Register(),
    const Info(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List Product'),
          actions: [
            InkWell(
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
              onTap: () {
                _onItemTapped(3);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 30, top: 8, bottom: 8),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Icon(
                        Icons.shopping_bag,
                        size: 24,
                        color: Colors.blue.shade500,
                      ),
                    ),
                    Positioned(
                      child: Consumer<ProductsVM>(
                        builder: (context, value, child) => CartCounter(
                          count: value.lst.length.toString(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        drawer: _drawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue.shade300,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.category_outlined),
              label: 'Category',
              backgroundColor: Colors.blue.shade300,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.list_rounded),
              label: 'Product',
              backgroundColor: Colors.blue.shade300,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart_rounded),
              label: 'Cart',
              backgroundColor: Colors.blue.shade300,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.app_registration_rounded),
              label: 'Register',
              backgroundColor: Colors.blue.shade300,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.info_outlined),
              label: 'Info',
              backgroundColor: Colors.blue.shade300,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 11, 7, 233),
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Drawer _drawer() => Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Top
            _topDrawer(),
            //Bottom
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.72,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.blue.shade100,
                    highlightColor: Colors.blue.shade200,
                    onTap: () {
                      setState(() {
                        if (index == 4) {
                          currentIndex = 3;
                          return;
                        }
                        currentIndex = index;
                      });
                      Future.delayed(const Duration(milliseconds: 200), () {
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? Colors.blue.shade500
                            : Colors.transparent,
                        border: index == drawerItem.length - 1
                            ? Border(
                                top: BorderSide(
                                    color: Colors.grey.shade200, width: 1.5),
                              )
                            : null,
                      ),
                      child: ListTile(
                        leading: Icon(
                          drawerItem[index]['icon'],
                          color: currentIndex == index
                              ? Colors.white
                              : Colors.black54,
                        ),
                        title: Text(
                          drawerItem[index]['title'],
                          style: TextStyle(
                            color: currentIndex == index
                                ? Colors.white
                                : Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );

  Widget _topDrawer() {
    return Consumer<ProductsVM>(
      builder: (context, value, child) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.28,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.blue.shade300,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                  //
                  ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network('${urlAssets}avt.jpg'),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              title: Text(
                value.user.fullname ?? '[Your name?]',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black
                    //
                    ),
              ),
              subtitle: Text(
                '22DH******@st.huflit.edu.vn',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    color: Colors.black.withOpacity(.4)
                    //
                    ),
                //
              ),
            ),
          ],
        ),
      ),
    );
  }
}

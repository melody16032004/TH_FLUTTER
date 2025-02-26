/*
import 'package:buoi_03/const/const.dart';
import 'package:buoi_03/page/register.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(),
      bottomNavigationBar: _bottomNavigationBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        // leading: const Icon(
        //   Icons.menu,
        //   color: Colors.white,
        // ),
        title: const Text(
          'Navigator',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 18,
            //
          ),
        ),
      ),
      body: currentIndex == 0
          ? Container()
          : currentIndex == 1
              ? Container()
              : currentIndex == 2
                  ? Container()
                  : const Register(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (value) {
        setState(() {
          value == drawerItem.length - 1
              ? currentIndex = 0
              : currentIndex = value;
        });
      },
      fixedColor: Colors.black,
      backgroundColor: Colors.blue.shade300,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_rounded),
          label: 'Home',
          backgroundColor: Colors.blue.shade300,
          //
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.contact_emergency_rounded),
          label: 'Contact',
          backgroundColor: Colors.blue.shade300,
          //
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_pin_rounded), label: 'Info',
          backgroundColor: Colors.blue.shade300,
          //
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.app_registration_rounded),
          label: 'Register',
          backgroundColor: Colors.blue.shade300,
        ),
      ],
    );
  }

  Drawer _drawer() {
    return Drawer(
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
  }

  Container _topDrawer() {
    return Container(
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
              child: Image.network(url_img),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            title: const Text(
              '[Your name?]',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black
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
    );
  }
}
*/
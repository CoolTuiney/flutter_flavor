import 'package:flutter/material.dart';
import 'package:flutter_flavour_ex/app.dart';
import 'package:flutter_flavour_ex/constants.dart';

import 'home_screen_body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.white,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: const CustomAppBar(),
      ),
      body: const HomeScreenBody(),
      bottomNavigationBar: const HomeScreenBNB(),
    );
  }
}

class HomeScreenBNB extends StatelessWidget {
  const HomeScreenBNB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: ColorConstant.black,
            ),
            label: "Test"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
              color: ColorConstant.black,
            ),
            label: "Test"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.card_travel,
              color: ColorConstant.black,
            ),
            label: "Test"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline,
              color: ColorConstant.black,
            ),
            label: "Test"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: ColorConstant.black,
            ),
            label: "Test"),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
      child: Row(
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ColorConstant.lightGrey),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Search what you want",
                    prefixIcon: Icon(
                      Icons.search,
                      color: ColorConstant.black,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorConstant.lightGrey),
                child: const Icon(
                  Icons.notifications_none_outlined,
                  size: 26,
                ),
              ),
              Positioned(
                right: 4,
                top: 5,
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.redAccent),
                    child: const Text(
                      '10',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_flavour_ex/home_screen/main.dart';

import 'constants.dart';

class App extends StatelessWidget {
  final String flavor;
  const App({Key? key, required this.flavor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData.light().colorScheme.copyWith(
              primary: ColorConstant.black,
            ),
      ),
      home: MyHomePage(title: 'Flutter Flavor $flavor'),
    );
  }
}

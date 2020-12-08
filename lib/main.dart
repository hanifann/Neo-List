import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:neo_list/share/colors.dart';
import 'package:neo_list/view/home/home_screen.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: backgroundColor,
        lightSource: LightSource.topLeft,
        depth: 8,
      ),
      home: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        home: HomeScreen(),
        theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      ),
    );
  }
}

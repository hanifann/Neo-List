import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:neo_list/services/database_service.dart';
import 'package:neo_list/share/colors.dart';
import 'package:neo_list/view/home/home_screen.dart';
import 'package:neo_list/view/onBoard/onboard_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.initDb();
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
        home: OnboardingScreen(),
        theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      ),
    );
  }
}

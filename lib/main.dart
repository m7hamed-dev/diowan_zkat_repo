import 'package:diowan_zkat/screens/splash_page.dart';
import 'package:diowan_zkat/tools/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الثمانية',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: AppColor.primaryColor,
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      home: const SplashScreenPage(),
      // home: const ListDeservedAdditionPage(),
    );
  }
}

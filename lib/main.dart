import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/MenuNav/Menu2.dart';
import 'package:pas/Pages/FirstPage.dart';
import 'package:pas/Pages/Login.dart';
import 'package:pas/Pages/Sign.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/", page: () => const Firstpage()),
        GetPage(name: "/Login", page: () => const Login()),
        GetPage(name: "/Sign", page: () => Sign()),
        GetPage(name: "/Favorite", page: () => AnimeView()),
      ],
      home: const Firstpage(),
    );
  }
}

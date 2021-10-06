// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:soal_16_starwarsapi/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return GetMaterialApp(
          title: 'Starwars Character App',
          home: const HomePage(),
          defaultTransition: Transition.cupertino,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

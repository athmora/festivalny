import 'package:flutter/material.dart';
import 'package:festivalny/src/pages/home/home_page.dart';

class NehuenYavuApp extends StatelessWidget {
  const NehuenYavuApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nehuen Yavu",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: const HomePage(),
    );
  }
}

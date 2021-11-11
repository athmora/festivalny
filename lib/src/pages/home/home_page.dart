import 'package:flutter/material.dart';
import 'package:festivalny/src/pages/home/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/logo.jpeg"),
          fit: BoxFit.contain,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.pink.withOpacity(.15),
        appBar: AppBar(
          title: const Text(
            "XXIV Festival de Danzas Clásicas\nNehuen Yavu",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const Center(
          child: HomeBody(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class CountPage extends StatefulWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
/*   int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  } */

  String daysBetween() {
    final f = DateTime(2021, 11, 22, 20, 30);
    final from = DateTime(f.year, f.month, f.day, f.hour, f.minute);

    final now = DateTime.now();

    final to = DateTime(now.year, now.month, now.day, now.hour, now.minute);
    final str = (to.difference(from).inHours * -1).toString();
    return str;
  }

  final hoy = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.pink.withOpacity(.7)),
      child: Center(
        child: Text(
          "Faltan ${daysBetween()} hora/s\npara el festival",
          style: const TextStyle(color: Colors.white, fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

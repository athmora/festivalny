import 'package:flutter/material.dart';

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

  String daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    final str = (to.difference(from).inDays * -1).toString();
    return str;
  }

  final diaDelFestival = DateTime(2021, 11, 22);
  final hoy = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.pink.withOpacity(.7)),
      child: Center(
        child: Text(
          "Faltan ${daysBetween(diaDelFestival, hoy)} días\npara el festival",
          style: const TextStyle(color: Colors.white, fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

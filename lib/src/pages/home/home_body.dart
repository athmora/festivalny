import 'dart:async';

import 'package:festivalny/src/models/baile.dart';
import 'package:festivalny/src/pages/count_page.dart';
import 'package:festivalny/src/pages/widgets/loading_widget.dart';
import 'package:festivalny/src/services/firebase_provider.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late Timer _timer;
  List<Baile> bailes = [];

  @override
  void initState() {
    super.initState();
    refresh();
    _initTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  _initTimer() {
    _timer = Timer.periodic(const Duration(seconds: 30), (_) => refresh());
  }

  Future<void> refresh() async {
    final _bailes = await FirebaseProvider.bailes;
    if (!FirebaseProvider.parte.enFestival) _timer.cancel();
    setState(() {
      bailes = _bailes;
    });
  }

  Widget _buildFechas() {
    if (FirebaseProvider.parte.enFestival) {
      return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        itemCount: bailes.length,
        itemBuilder: (_, i) => bailes[i].toTile,
      );
    } else {
      if (FirebaseProvider.parte.mostrarPreFestival) {
        return const CountPage();
      } else {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.pink.withOpacity(.7)),
          child: const Center(
            child: Text(
              "Agradecemos a las familias por habernos acompañado!\nEsperamos lo hayan disfrutado.\nMuchas gracias!",
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Baile>>(
      future: FirebaseProvider.bailes,
      builder: (BuildContext context, AsyncSnapshot<List<Baile>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return RefreshIndicator(
            child: _buildFechas(),
            onRefresh: () => refresh(),
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}

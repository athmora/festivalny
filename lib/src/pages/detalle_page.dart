import 'package:festivalny/src/models/baile.dart';
import 'package:flutter/material.dart';

class DetallePage extends StatelessWidget {
  const DetallePage({
    Key? key,
    required this.baile,
  }) : super(key: key);
  final Baile baile;

  final _style = const TextStyle(color: Colors.black, fontSize: 24);
  @override
  Widget build(BuildContext context) {
    final String _fotoUrl  = baile.tieneFoto ? "assets/${baile.numero}.png" : "assets/nophoto.png";
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(baile.nombre),
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              _fotoUrl,
              fit: BoxFit.contain,
              color: baile.selected ? null : Colors.grey,
              height: size.height,
              width: size.width,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Theme.of(context).scaffoldBackgroundColor
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, size.height * .4, 16.0, 8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Text(
                  baile.participantes,
                  style: _style,
                  textAlign: TextAlign.justify,
                  softWrap: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

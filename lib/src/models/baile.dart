import 'package:festivalny/src/pages/detalle_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Baile {
  final String docid;
  final String nombre;
  final int numero;
  final String academia;
  final String participantes;
  final bool selected;

  Baile({
    required this.docid,
    required this.nombre,
    required this.numero,
    required this.academia,
    required this.participantes,
    required this.selected,
  });

  factory Baile.fromDocument(Map<String, dynamic> data, String docid) {
    final _this = Baile(
      docid: docid,
      nombre: data["nombre"].toString(),
      numero: int.parse(data["numero"].toString()),
      academia: data["academia"].toString(),
      participantes: data["participantes"].toString(),
      selected: data["selected"] ?? false,
    );

    return _this;
  }

  Map<String, Object?> get toJson => {
        "nombre": nombre,
        "numero": numero,
        "academia": academia,
        "participantes": participantes,
        "selected": selected,
      };

  Widget get toTile => _ToTile(baile: this);
}

class _ToTile extends StatelessWidget {
  const _ToTile({Key? key, required this.baile}) : super(key: key);
  final Baile baile;

  @override
  Widget build(BuildContext context) {
    final _pink = Colors.pink.withOpacity(0.85);
    return Card(
      color: baile.selected ? _pink : Colors.white,
      child: ListTile(
        title: Text(
          baile.nombre,
          style: TextStyle(
            color: !baile.selected ? _pink : Colors.white,
          ),
        ),
        subtitle: Text(
          baile.academia,
          style: TextStyle(
            color: !baile.selected ? _pink : Colors.white,
            fontSize: 11,
          ),
        ),
        leading: Text(
          "${baile.numero}.",
          style: TextStyle(
            color: !baile.selected ? _pink : Colors.white,
            fontSize: 36,
          ),
        ),
        selected: baile.selected,
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (_) => DetallePage(baile: baile)),
          );
        },
      ),
    );
  }
}

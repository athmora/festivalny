import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festivalny/src/models/baile.dart';
import 'package:festivalny/src/models/parte.dart';

class FirebaseProvider {
  static Parte parte = Parte(parte: ParteEnum.pre, docid: "");

  static Future<List<Baile>> get bailes async {
    final QuerySnapshot<Parte> parteDoc = await FirebaseFirestore.instance
        .collection("parte")
        .withConverter(
          fromFirestore: (snapshot, _) =>
              Parte.fromDocument(snapshot.data()!, snapshot.id),
          toFirestore: (Parte p, _) => p.toJson,
        )
        .get();

    late QuerySnapshot<Baile> _allBailes;

    final _parteInformer = parteDoc.docs.first.data();

    parte = _parteInformer;

    if (_parteInformer.mostrarPrimeraParte) {
      _allBailes = await FirebaseFirestore.instance
          .collection("bailes")
          .where("numero", isLessThanOrEqualTo: 6)
          .withConverter(
            fromFirestore: (snapshot, _) =>
                Baile.fromDocument(snapshot.data()!, snapshot.id),
            toFirestore: (Baile b, _) => b.toJson,
          )
          .get();
    } else {
      _allBailes = await FirebaseFirestore.instance
          .collection("bailes")
          .where("numero", isGreaterThan: 6)
          .withConverter(
            fromFirestore: (snapshot, _) =>
                Baile.fromDocument(snapshot.data()!, snapshot.id),
            toFirestore: (Baile b, _) => b.toJson,
          )
          .get();
    }
    List<Baile> bailes = [];

    for (QueryDocumentSnapshot<Baile> b in _allBailes.docs) {
      final Baile _b = b.data();
      bailes.add(_b);
    }

    bailes.sort((a, b) => a.numero.compareTo(b.numero));

    return bailes;
  }
}

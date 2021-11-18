class Parte {
  final String docid;
  final ParteEnum parte;

  Parte({
    required this.docid,
    required this.parte,
  });

  factory Parte.fromDocument(Map<String, dynamic> data, String docid) {
    final _this = Parte(
      docid: docid,
      parte: _parteEnumFromString(data["parte"].toString()),
    );

    return _this;
  }

  Map<String, Object?> get toJson => {"parte": parte.toStr};

  bool get mostrarPrimeraParte => parte == ParteEnum.primera;
  bool get mostrarSegundaParte => parte == ParteEnum.segunda;
  bool get mostrarPreFestival => parte == ParteEnum.pre;
  bool get mostrarCorte => parte == ParteEnum.corte;
  bool get mostrarPostFestival => parte == ParteEnum.post;
  bool get enFestival =>
      parte == ParteEnum.primera || parte == ParteEnum.segunda;
}

enum ParteEnum { pre, primera, segunda, post, corte }

extension ParteEnumExt on ParteEnum {
  String get toStr {
    String s = "";
    switch (this) {
      case ParteEnum.primera:
        s = "primera";
        break;
      case ParteEnum.segunda:
        s = "segunda";
        break;
      case ParteEnum.corte:
        s = "corte";
        break;
      case ParteEnum.pre:
        s = "pre";
        break;
      case ParteEnum.post:
        s = "post";
        break;
    }
    return s;
  }
}

ParteEnum _parteEnumFromString(String parte) {
  ParteEnum e = ParteEnum.primera;
  switch (parte) {
    case "primera":
      e = ParteEnum.primera;
      break;
    case "segunda":
      e = ParteEnum.segunda;
      break;
    case "pre":
      e = ParteEnum.pre;
      break;
    case "corte":
      e = ParteEnum.corte;
      break;
    case "post":
      e = ParteEnum.post;
      break;
  }
  return e;
}

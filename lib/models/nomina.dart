class Nomina {

  final String LocalNombre;


  Nomina({required this.LocalNombre});

  factory Nomina.fromJson(Map<String, dynamic> json) {
    return Nomina(
      LocalNombre: ''
    );
  }

  String get nombre {
    return LocalNombre;
  }


}
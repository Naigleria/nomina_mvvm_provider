class Nomina {
  //final int? id;
  final DateTime? paymentDate;
  final int? user;
  bool boolCheckBox;
  final String? urlPayroll;

  Nomina({this.paymentDate, this.user, required this.boolCheckBox, this.urlPayroll});

  factory Nomina.fromJson(Map<String, dynamic> json) {
    return Nomina(
      //id: json["id"],
      paymentDate: DateTime.parse(json["payment_date"]),
      user: json["user"],
      boolCheckBox: false,
      urlPayroll: json['url_pdf'],
    );
  }

  Map<String, dynamic> toJson() => {

      "payment_date": "${paymentDate!.year.toString().padLeft(4, '0')}-${paymentDate!.month.toString().padLeft(2, '0')}-${paymentDate?.day.toString().padLeft(2, '0')}",
      "user": user,
  };



}
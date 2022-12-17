import 'dart:convert';
import 'package:http/http.dart' as http;

class NominaDescWebservice {

  Future<dynamic> dowloadNominaApi() async {

    //final url = "http://www.omdbapi.com/?s=$keyword&apikey=YOURAPIKEY";
    try{

      var url = Uri.https('cdn.syncfusion.com','/content/PDFViewer/flutter-succinctly.pdf');
      final response = await http.get(url);
      return response;

    }catch(e){
      print(e);
      print("Unable to perform request");
    }

  }
}
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

class NominaListWebservice {

  String? baseUrl =dotenv.env['BASE_URL'];

Future<dynamic> fetchNominasListApi() async {


    try{

      final prefs = await SharedPreferences.getInstance();
      String? id = prefs.getInt('user_id').toString();
      var url = Uri.http(baseUrl!,'/payroll/list/$id');
      final response = await http.get(url);




      var json =jsonDecode(response.body);
      return Tuple2(json, response.statusCode);



    }catch(e){
      print("loginWebService Exception: $e");
    }

  }
}
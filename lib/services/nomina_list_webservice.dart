import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nomina_mvvm_provider/appData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

class NominaListWebservice {

Future<dynamic> fetchNominasListApi() async {

    //var url = Uri.http('3.95.16.122', 'payroll/login/');
    try{
      print("segundo fetch");
      final prefs = await SharedPreferences.getInstance();
      String? id = prefs.getInt('user_id').toString();
      var url = Uri.http(appData.baseUrl,'/payroll/list/$id');
      final response = await http.get(url);
      print("despues de la peticion");



      var json =jsonDecode(response.body);
      return Tuple2(json, response.statusCode);



    }catch(e){
      print("loginWebService Exception: $e");
    }

  }
}
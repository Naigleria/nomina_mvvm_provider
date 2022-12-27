import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SharedWebService{

  String? baseUrl =dotenv.env['BASE_URL'];

  Future<dynamic> logout() async {

    //final url = "http://www.omdbapi.com/?s=$keyword&apikey=YOURAPIKEY";

    var url = Uri.http(baseUrl!, 'auth/logout/');

    try{
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('Token');
      final response = await http.post(url,
        body: {
          "Token":token,
        }
      );
      if(response.statusCode == 200) {

        return jsonDecode(response.body);

      } else {
        print("StatusCode not 200");
        return jsonDecode(response.body);
      }
    }
    catch(e){
      print(e);
    }


  }
}
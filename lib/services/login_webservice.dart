import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nomina_mvvm_provider/appData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWebservice {

  Future<dynamic> loginApi(String username, String password) async {

    //final url = "http://www.omdbapi.com/?s=$keyword&apikey=YOURAPIKEY";

    var url = Uri.http('3.95.16.122', 'auth/login/');

    try{
      final response = await http.post(url,
        body: {
          "email":username,
          "password":password
        }
      );
      if(response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        var json = jsonDecode(response.body);
        await prefs.setString('Token', json["Token"]);
        await prefs.setInt('user_id', json['user']['id']);
        return json;

      } else{
        print("StatusCode not 200");
        return jsonDecode(response.body);
      }
    }catch(e){
      print(e);
    }



  }

  Future<dynamic> sendCodeToEmailApi(String email)async{
    //
    var url = Uri.http(appData.baseUrl, 'auth/sendCodeEmail/');
    try{
      final response = await http.post(url,
        body: {
          "email":email,
        }
      );
      if(response.statusCode == 200) {

        return jsonDecode(response.body);

      } else{
        print("StatusCode not 200");
        return jsonDecode(response.body);
      }
    }catch(e){
      print(e);
    }
  }

  Future<dynamic> validateCodeApi(String code)async{
    //
    var url = Uri.http('3.95.16.122', 'auth/validateCode/');
    try{
      final response = await http.post(url,
        body: {
          "code":code,
        }
      );
      if(response.statusCode == 200) {

        return jsonDecode(response.body);

      } else{
        print("StatusCode not 200");
        return jsonDecode(response.body);
      }
    }catch(e){
      print(e);
    }
  }

  Future<dynamic> restorePasswordApi(String password, String userId)async{
    //
    var url = Uri.http('3.95.16.122', 'auth/resetPasswordView/');
    try{
      final response = await http.post(url,
        body: {
          "password":password,
          "user": userId
        }
      );
      if(response.statusCode == 200) {

        return jsonDecode(response.body);

      } else{
        print("StatusCode not 200");
        return jsonDecode(response.body);
      }
    }catch(e){
      print(e);
    }
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginWebservice {

  Future<dynamic> loginApi() async {

    //final url = "http://www.omdbapi.com/?s=$keyword&apikey=YOURAPIKEY";

    var url =
    Uri.https('api.themoviedb.org', '3/movie/now_playing',{
      'language':'es-Es',
      //'page': (index+1).toString(),
      //'api_key':appData.apy_key
    });

    final response = await http.get(url);

    if(response.statusCode == 200) {

      return jsonDecode(response.body);

    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
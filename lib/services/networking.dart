import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:clima/main.dart';

class NetworkHelper{
  NetworkHelper({required this.url});
  final String url;

  Future getData({required latitude,required longitude})async{
       http.Response response = await http.get(Uri.parse(
        url));
       
    if (response.statusCode == 200) {
       String data=response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
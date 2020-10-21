import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> getData() async {
  try{
    var response = await http.get(
        'https://api.covid19api.com/summary'
    );
    return jsonDecode(response.body);
  } catch (err){
    print(err.toString());
  }
}
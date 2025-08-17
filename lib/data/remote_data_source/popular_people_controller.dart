import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/popular_people_model.dart';

class PopularPeopleController {
  static String url =
      "https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b";
  static Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  static Future<PopularPeopleModel?> getPopularPeople() async {
    var responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      Map<String, dynamic> decoded;
      decoded = json.decode(responce.body);
      log(responce.statusCode.toString(), name: "status code");
      log(json.decode(responce.body).toString(), name: "response");
      return PopularPeopleModel.fromJson(decoded);
    }
    return null;
  }
}

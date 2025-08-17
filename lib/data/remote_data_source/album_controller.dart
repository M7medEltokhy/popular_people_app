import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:itproject/data/models/Album_model.dart';

class AlbumController {
  static Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  static Future<AlbumModel?> getAlbum({required String id}) async {
    var response = await http.get(
        Uri.parse(
            "https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b"),
        headers: headers);
    if(response.statusCode == 200){
      Map<String,dynamic> decoded;
      decoded= json.decode(response.body);
      log(response.statusCode.toString(), name: "status code");
      log(json.decode(response.body).toString(), name: "response");
      return AlbumModel.fromJson(decoded);
    }
    return null;
  }
}

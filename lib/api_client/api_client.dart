import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/models/character_model.dart';

class ApiClient{
  final url = 'https://rickandmortyapi.com/api/character';
  Future<Character> getCharacters(int page, String name)async{
    try{
      var response = await http.get(Uri.parse(url + '?page=$page&name=$name'));

      var jsonResult = json.decode(response.body);
      return Character.fromJson(jsonResult);
    }catch(e){
      throw Exception(e.toString());
    }
  }
}
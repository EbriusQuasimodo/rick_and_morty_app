import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/models/character_model.dart';

class ApiClient{

  Future<CharacterList> getCharacters()async{
    final url = Uri.parse('https://rickandmortyapi.com/api/character');

    final response = await http.get(url);

    if (response.statusCode == 200){

      return CharacterList.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('error');
    }
  }
}
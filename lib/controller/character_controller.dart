import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:rick_and_morty_app/api_client/api_client.dart';
import 'package:rick_and_morty_app/models/character_model.dart';

class CharacterController extends ControllerMVC{

  final ApiClient apiClient = new ApiClient();

  CharacterController();

  CharacterResult currentState = CharacterResultLoading();


  void init ()async{

    try {
      final characterList = await apiClient.getCharacters();

      setState(() => currentState = CharacterResultSuccess(characterList));

    }catch (error) {
      setState(() => currentState = CharacterResultError('error'));

    }
  }
}
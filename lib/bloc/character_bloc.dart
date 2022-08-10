import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_app/api_client/api_client.dart';
import 'package:rick_and_morty_app/models/character_model.dart';


part 'character_bloc.freezed.dart';
//part 'character_bloc.g.dart';
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState>{
  final ApiClient apiClient;
  CharacterBloc({required this.apiClient}) : super(const CharacterState.loading()){
    on<CharacterEventFetch>((event, emit) async{
      emit (const CharacterState.loading());

      try{
        Character _characterLoaded = await apiClient.getCharacters(event.page, event.name);
        emit (CharacterState.loaded(characterLoaded: _characterLoaded));

      }catch(_){
        emit(const CharacterState.error());
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/api_client/api_client.dart';
import 'package:rick_and_morty_app/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/screens/home_screen/custom_list_tile.dart';


class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  late Character _currentCharacter;
  List<Results>_currentResult = [];
  int _currentPage = 1;
  final apiClient = ApiClient();
 // late final Results idResults;

  final ScrollController _scrollController = new ScrollController();
  bool isScrolled = false;

  //final RefreshController refreshController = RefreshController();
  //bool _isPagination = false;

  @override
  void initState(){

    if(_currentResult.isEmpty) {
      context
          .read<CharacterBloc>()
          .add(const CharacterEvent.fetch(name: "", page: 1));
    }

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){

        print ('asdasd');
        isScrolled = true;
        //_currentPage++;
        print (_currentPage);
        load();

      }
    });
    super.initState();
}
void load() {
 //тут нужно загружать следующие 20 персонажей, но я не понимаю как это сделать
}


@override
void dispose(){
    super.dispose();
    _scrollController.dispose();
}

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharacterBloc>().state;
    return state.when(
        loading: (){
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(strokeWidth: 1),
                  SizedBox(width: 20),
                  Text('loading.....'),
                ],
              ),
            );

        },
        loaded: (characterLoaded) {
          _currentCharacter = characterLoaded;
            _currentResult.addAll(_currentCharacter.results);
            _currentResult = _currentCharacter.results;
          return _currentResult.isNotEmpty
              ? CustomListView(_currentResult)
              : const Text('_currentResult пустой');
        },
        error: () => const Text('Nothing found....'),
    );
  }
  
  Widget CustomListView(List<Results> currentResults){
    return ListView.builder(
      controller: _scrollController,
        //separatorBuilder: (_, index) => const SizedBox(height: 5,),
      itemCount: currentResults.length,

      shrinkWrap: true,
      itemBuilder: (context, index) {

          final result = currentResults[index];
          return Padding(
            padding: const EdgeInsets.only(top: 3, left: 13,right: 13, bottom: 3),
            child: CustomListTile(
              result: result,
            ),
          );
      },
    );
  }
}

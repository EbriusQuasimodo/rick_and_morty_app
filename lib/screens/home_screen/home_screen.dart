import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/api_client/api_client.dart';
import 'package:rick_and_morty_app/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/screens/home_screen/list_view_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final apiClient = ApiClient();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightGreenAccent[700],
        title: Text('Rick and Morty',
        style: TextStyle(
            fontWeight: FontWeight.w300,
          fontSize: 25
        ),),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => CharacterBloc(apiClient: apiClient),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Flexible(child: const ListViewPage()),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}



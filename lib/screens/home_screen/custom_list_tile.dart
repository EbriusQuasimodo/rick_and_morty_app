import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character_model.dart';


class CustomListTile extends StatefulWidget {
  final Results result;
  const CustomListTile({
    Key? key,
    required this.result
  }) : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: MediaQuery.of(context).size.height / 7,
        color: Colors.lightGreenAccent[700],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(widget.result.image),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.9,
                    child: Text(
                      widget.result.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'species',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Colors.white,),
                            ),
                            SizedBox(height: 2),
                            Text(
                              widget.result.species,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,),
                            ),
                          ],
                        ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'gender',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: Colors.white,),
                        ),
                        SizedBox(height: 2),
                        Text(
                          widget.result.gender,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,),
                        ),
                      ],
                    ),
                      ],

                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

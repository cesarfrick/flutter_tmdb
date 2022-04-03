import 'package:flutter/material.dart';
import 'package:tmdb_app/components/cast/cast_card.dart';
import 'package:tmdb_app/models/actor.dart';

class CastList extends StatelessWidget {
  const CastList({Key? key, required this.actors}) : super(key: key);

  final List<Actor> actors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        Actor actor = actors[index];

        return CastCard(
          imgSrc: actor.imgSrc,
          name: actor.name,
          character: actor.character,
        );
      },
      itemCount: actors.length,
    );
  }
}

import 'package:flutter/material.dart';

import 'package:tmdb_app/components/card.dart';

class CardsList extends StatelessWidget {
  const CardsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const <Widget>[
        MovieCard(
          title: 'Game of Thrones',
          releaseDate: 'April 27, 2011',
          imageSrc: 'assets/images/got_poster.jpeg',
          rating: 84,
        ),
        MovieCard(
          title: 'Game of Thrones',
          releaseDate: 'April 27, 2011',
          imageSrc: 'assets/images/got_poster.jpeg',
          rating: 84,
        ),
        MovieCard(
          title: 'Game of Thrones',
          releaseDate: 'April 27, 2011',
          imageSrc: 'assets/images/got_poster.jpeg',
          rating: 84,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:tmdb_app/components/movie_card.dart';
import 'package:tmdb_app/screens/details.dart';

class CardsList extends StatelessWidget {
  const CardsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Category',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemBuilder: (context, i) {
                return MovieCard(
                  title: 'Game of Thrones',
                  releaseDate: 'April 27, 2011',
                  imageSrc: 'assets/images/got_poster.jpeg',
                  rating: 84,
                  id: 1234,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Details(
                          title: 'Game of Thrones',
                          posterSrc: 'assets/images/got_poster.jpeg',
                          id: 1234,
                        ),
                      ),
                    );
                  },
                );
              },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Divider(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

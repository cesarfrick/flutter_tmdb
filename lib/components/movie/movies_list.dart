import 'package:flutter/material.dart';

import 'package:tmdb_app/components/movie/movie_card.dart';
import 'package:tmdb_app/screens/details.dart';
import 'package:tmdb_app/models/movies/movie.dart';

class CardsList extends StatelessWidget {
  const CardsList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<Movie> movies;

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
                final movie = movies[i];

                return MovieCard(
                  title: movie.title,
                  releaseDate: movie.releaseDate,
                  imageSrc: 'assets/images/got_poster.jpeg',
                  rating: movie.voteAverage * 10,
                  id: movie.id,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                          title: movie.title,
                          posterSrc: 'assets/images/got_poster.jpeg',
                          id: movie.id,
                          rating: movie.voteAverage,
                          releaseDate: movie.releaseDate,
                        ),
                      ),
                    );
                  },
                );
              },
              itemCount: movies.length,
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

import 'package:flutter/material.dart';
import 'package:global_configs/global_configs.dart';

import 'package:tmdb_app/components/movie/movie_card.dart';
import 'package:tmdb_app/screens/details_screen.dart';
import 'package:tmdb_app/models/movies/movie.dart';

class CardsList extends StatelessWidget {
  CardsList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<Movie> movies;

  final String _imgBaseURL = GlobalConfigs().get('api.images.secure_base_url');
  final String _posterSize = GlobalConfigs().get('api.images.poster_sizes')[3];


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
                final String posterSrc =
                    '$_imgBaseURL$_posterSize${movie.posterPath}';

                return MovieCard(
                  title: movie.title,
                  releaseDate: movie.releaseDate,
                  imageSrc: posterSrc,
                  rating: movie.voteAverage * 10,
                  id: movie.id,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          title: movie.title,
                          posterSrc: posterSrc,
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

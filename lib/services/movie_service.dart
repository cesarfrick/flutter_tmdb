import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:tmdb_app/models/movies/movie_details.dart';
import 'package:tmdb_app/models/movies/movies.dart';

class MovieService {
  static Future<Movies> getMovies() async {
    try {
      String moviesJSON =
          await rootBundle.loadString('assets/data/movies.json');
      Movies movies = Movies.fromRawJson(moviesJSON);

      return movies;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<MovieDetails> getMovie(int movieId) async {
    try {
      String moviesJSON = await rootBundle.loadString('assets/data/movie.json');
      MovieDetails movie = MovieDetails.fromRawJson(moviesJSON);

      return movie;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}

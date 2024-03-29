import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:tmdb_app/models/genres/genre.dart';
import 'package:tmdb_app/models/genres/genres.dart';
import 'package:tmdb_app/models/movies/movie.dart';
import 'package:tmdb_app/models/movies/movie_details.dart';
import 'package:tmdb_app/models/movies/movies.dart';
import 'package:tmdb_app/models/movies/movies_by_genre.dart';

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

  static Future<Genres> getGenres() async {
    try {
      String genresJSON =
          await rootBundle.loadString('assets/data/genres.json');
      Genres genres = Genres.fromRawJSON(genresJSON);
      return genres;
    } catch (error) {
      throw ErrorDescription(error.toString());
    }
  }

  static Future<List<MoviesByGenre>> getMoviesByGenre() async {
    try {
      Genres genres = await MovieService.getGenres();
      Movies movies = await MovieService.getMovies();

      List<MoviesByGenre> _moviesByGenre = [];

      for (Genre genre in genres.genres) {
        Iterable<Movie> _movies;
        _movies =
            movies.data.where((_movie) => _movie.genreIds.contains(genre.id));
        _moviesByGenre.add(MoviesByGenre(
            genreId: genre.id, genreName: genre.name, movies: _movies));
      }

      return _moviesByGenre;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}

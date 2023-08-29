import 'package:tmdb_app/models/movies/movie.dart';

class MoviesByGenre {
  const MoviesByGenre({
    required genreId,
    required genreName,
    required Iterable<Movie> movies,
  });
}

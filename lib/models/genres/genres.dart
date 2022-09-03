import 'dart:convert';
import 'genre.dart';

class Genres {
  List<Genre> genres = [];

  Genres({required this.genres});

  factory Genres.fromRawJSON(String str) {
    List<String> data = json.decode(str);
    List<Genre> items =
        data.map((String item) => Genre.fromRawJson(item)).toList();

    return Genres(genres: items);
  }
}

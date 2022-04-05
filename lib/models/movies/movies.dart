// To parse this JSON data, do
//
//     final movies = moviesFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:tmdb_app/models/movies/movie.dart';

class Movies {
  const Movies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  factory Movies.fromRawJson(String str) => Movies.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

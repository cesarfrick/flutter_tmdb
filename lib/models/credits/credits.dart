import 'dart:convert';

import 'package:tmdb_app/models/credits/staff.dart';

class Credits {
  Credits({
    required this.cast,
    required this.crew,
  });

  final List<Staff> cast;
  final List<Staff> crew;

  factory Credits.fromRawJson(String str) => Credits.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Credits.fromJson(Map<String, dynamic> json) => Credits(
        cast: List<Staff>.from(json["cast"].map((x) => Staff.fromJson(x))),
        crew: List<Staff>.from(json["crew"].map((x) => Staff.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
      };
}

import 'dart:convert';

import 'package:tmdb_app/models/shared/enums.dart';

class Video {
  Video({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  final OriginalLanguage iso6391;
  final OriginCountry iso31661;
  final String name;
  final String key;
  final Site site;
  final int size;
  final Type type;
  final bool official;
  final DateTime publishedAt;
  final String id;

  factory Video.fromRawJson(String str) => Video.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        iso6391:
            originalLanguageValues.map[json["iso_639_1"]] as OriginalLanguage,
        iso31661: originCountryValues.map[json["iso_3166_1"]] as OriginCountry,
        name: json["name"],
        key: json["key"],
        site: siteValues.map[json["site"]] as Site,
        size: json["size"],
        type: typeValues.map[json["type"]] as Type,
        official: json["official"],
        publishedAt: DateTime.parse(json["published_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "iso_639_1": originalLanguageValues.reverse[iso6391],
        "iso_3166_1": originCountryValues.reverse[iso31661],
        "name": name,
        "key": key,
        "site": siteValues.reverse[site],
        "size": size,
        "type": typeValues.reverse[type],
        "official": official,
        "published_at": publishedAt.toIso8601String(),
        "id": id,
      };
}

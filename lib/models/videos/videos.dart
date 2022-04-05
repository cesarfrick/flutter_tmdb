import 'dart:convert';

import 'package:tmdb_app/models/videos/video.dart';

class Videos {
  Videos(this.videos);

  final List<Video> videos;

  factory Videos.fromRawJson(String str) => Videos.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        List<Video>.from(json["results"].map((x) => Video.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(videos.map((x) => x.toJson())),
      };
}

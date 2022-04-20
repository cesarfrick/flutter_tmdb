import 'dart:convert';

import 'package:tmdb_app/models/shared/enums.dart';

class Staff {
  Staff({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.creditId,
    this.order,
    this.character,
    this.castId,
    this.profilePath,
    this.job,
    this.department,
  });

  final bool adult;
  final int gender;
  final int id;
  final Department knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String creditId;
  final int? order;
  final String? profilePath;
  final String? character;
  final int? castId;
  final Department? department;
  final String? job;

  factory Staff.fromRawJson(String str) => Staff.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment:
            departmentValues.map[json["known_for_department"]] as Department,
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"] == null
            ? null
            : departmentValues.map[json["department"]] as Department,
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": departmentValues.reverse[knownForDepartment],
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department":
            department == null ? null : departmentValues.reverse[department],
        "job": job,
      };
}

enum OriginalLanguage { EN, SV, FR, ES }
enum OriginCountry { US }
enum Site { YOU_TUBE }
enum Type { TEASER, FEATURETTE, CLIP, TRAILER }
enum Department {
  ACTING,
  EDITING,
  SOUND,
  PRODUCTION,
  ART,
  COSTUME_MAKE_UP,
  VISUAL_EFFECTS,
  CAMERA,
  WRITING,
  DIRECTING,
  LIGHTING,
  CREW,
}

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "fr": OriginalLanguage.FR,
  "sv": OriginalLanguage.SV
});
final originCountryValues = EnumValues({"US": OriginCountry.US});
final siteValues = EnumValues({"YouTube": Site.YOU_TUBE});

final typeValues = EnumValues({
  "Clip": Type.CLIP,
  "Featurette": Type.FEATURETTE,
  "Teaser": Type.TEASER,
  "Trailer": Type.TRAILER,
});

final departmentValues = EnumValues({
  "Acting": Department.ACTING,
  "Art": Department.ART,
  "Camera": Department.CAMERA,
  "Costume & Make-Up": Department.COSTUME_MAKE_UP,
  "Crew": Department.CREW,
  "Directing": Department.DIRECTING,
  "Editing": Department.EDITING,
  "Lighting": Department.LIGHTING,
  "Production": Department.PRODUCTION,
  "Sound": Department.SOUND,
  "Visual Effects": Department.VISUAL_EFFECTS,
  "Writing": Department.WRITING
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap.isEmpty) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}

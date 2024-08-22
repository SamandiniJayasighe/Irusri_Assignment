import "package:json_annotation/json_annotation.dart";

part 'country.g.dart';

@JsonSerializable()
class Country {
  final Map<String,String> flags;
  final String commonName;
  final String officialName;
  final List<String> capital;
  final Map<String, String> languages;
  final String region;
  final int population;

  Country({
    required this.flags,
    required this.commonName,
    required this.officialName,
    required this.capital,
    required this.languages,
    required this.region,
    required this.population,
  });

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson({...json,
  'commonName': json['name']['common'],
  'officialName': json['name']['official'],
});
  Map<String, dynamic> toJson() => _$CountryToJson(this)..addAll({
    'name': {
      'common': commonName,
      'official': officialName,
    }
  });

  
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      flags: Map<String, String>.from(json['flags'] as Map),
      commonName: json['commonName'] as String,
      officialName: json['officialName'] as String,
      capital:
          (json['capital'] as List<dynamic>).map((e) => e as String).toList(),
      languages: Map<String, String>.from(json['languages'] as Map),
      region: json['region'] as String,
      population: (json['population'] as num).toInt(),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'flags': instance.flags,
      'commonName': instance.commonName,
      'officialName': instance.officialName,
      'capital': instance.capital,
      'languages': instance.languages,
      'region': instance.region,
      'population': instance.population,
    };

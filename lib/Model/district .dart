import 'package:classic_ads/Model/city.dart';

class District {
  final int id;
  final String url;
  final String provinceId;
  final String nameEn;
  final String nameSi;
  final String nameTa;
  final List<City> cities;

  District({
    required this.id,
    required this.url,
    required this.provinceId,
    required this.nameEn,
    required this.nameSi,
    required this.nameTa,
    required this.cities,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['district']['id'],
      url: json['district']['url'],
      provinceId: json['district']['province_id'],
      nameEn: json['district']['name_en'],
      nameSi: json['district']['name_si'],
      nameTa: json['district']['name_ta'],
      cities: (json['cities'] as List)
          .map((cityJson) => City.fromJson(cityJson))
          .toList(),
    );
  }
}
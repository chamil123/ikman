import 'package:classic_ads/Model/city.dart';

class District {
  final int id;
  final String url;
  final int provinceId;
  final String nameEn;
  final String nameSi;
  final String? nameTa;
  final List<City> cities;

  District({
    required this.id,
    required this.url,
    required this.provinceId,
    required this.nameEn,
    required this.nameSi,
    this.nameTa,
    required this.cities,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    var districtData = json['district'];
    return District(
      id: districtData['id'],
      url: districtData['url'],
      provinceId: districtData['province_id'],
      nameEn: districtData['name_en'],
      nameSi: districtData['name_si'],
      nameTa: districtData['name_ta'],
      cities: (json['cities'] as List)
          .map((cityJson) => City.fromJson(cityJson))
          .toList(),
    );
  }
}

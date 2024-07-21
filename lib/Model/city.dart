class City {
  final int id;
  final String districtId;
  final String nameEn;
  // final String nameSi;
  // final String? nameTa;
  // final String? subNameEn;
  // // final String? subNameSi;
  // // final String? subNameTa;
  // final String postcode;
  // final String latitude;
  // final String longitude;

  City({
    required this.id,
    required this.districtId,
    required this.nameEn,
    // required this.nameSi,
    // this.nameTa,
    // this.subNameEn,
    // // this.subNameSi,
    // // this.subNameTa,
    // required this.postcode,
    // required this.latitude,
    // required this.longitude,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      districtId: json['district_id'],
      nameEn: json['name_en']
    //   nameSi: json['name_si'],
    //   nameTa: json['name_ta'],
    //   subNameEn: json['sub_name_en'],
    //   // subNameSi: json['sub_name_si'],
    //   // subNameTa: json['sub_name_ta'],
    //   postcode: json['postcode'],
    //   latitude: json['latitude'],
    //   longitude: json['longitude'],
    );
  }
}
import 'package:classic_ads/Model/Ads/base_model.dart';

class CarPostModel extends BasePostModel {
  int? brand;
  int? model;

  String? edition;
  String? manufacture_year;
  String? Mileage;
  String? engine_capacity;
  int? fuel_Type;
  int? transmission;
  int? type;

  CarPostModel({
    super.catId,
    super.subcatId,
    super.userId,
    required super.title,
    required super.price,
    required super.description,
    super.location,
    super.sublocation,
    required super.mainImage,
    // required super.subImages,
    super.subImages1,
    super.subImages2,
    super.subImages3,
    super.subImages4,
    super.priceType,
    super.postType,
    super.condition,
    super.planId,
    this.brand,
    this.model,
    this.edition,
    this.manufacture_year,
    this.Mileage,
    this.engine_capacity,
    this.fuel_Type,
    this.transmission,
    this.type,
  });

  factory CarPostModel.fromJson(Map<String, dynamic> json) {
    return CarPostModel(
      catId: json['catId'],
      subcatId: json['subcatId'],
      userId: json['userId'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      location: json['location'],
      sublocation: json['sublocation'],
      mainImage: json['mainImage'],
      // subImages: json['subImages'],
      subImages1: json['subImages1'],
      subImages2: json['subImages2'],
      subImages3: json['subImages3'],
      subImages4: json['subImages4'],
      priceType: json['price_type'],
      postType: json['post_type'],
      condition: json['condition'],
      planId: json['planId'],
      brand: json['brand'],
      model: json['model'],
      edition: json['edition'],
      manufacture_year: json['manufacture_year'],
      Mileage: json['Mileage'],
      engine_capacity: json['engine_capacity'],
      fuel_Type: json['fuel_Type'],
      transmission: json['transmission'],
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['brand'] = brand;
    data['model'] = model;
    // data['specialization'] = specialization?.toList();
    data['subImages1'] = subImages1;
    data['subImages2'] = subImages2;
    data['subImages3'] = subImages3;
    data['subImages4'] = subImages4;
    return data;
  }
}

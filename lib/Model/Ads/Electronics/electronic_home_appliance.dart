import 'package:classic_ads/Model/Ads/base_model.dart';

class ElectronicHomeAppliancesPostModel extends BasePostModel {
  int? type;
  int? brand;
  String? subImages1;
  String? subImages2;
  String? subImages3;
  String? subImages4;

  ElectronicHomeAppliancesPostModel({
    super.catId,
    super.subcatId,
    super.userId,
    required super.title,
    required super.price,
    required super.description,
    super.location,
    super.sublocation,
    required super.mainImage,
    this.subImages1,
    this.subImages2,
    this.subImages3,
    this.subImages4,
    super.priceType,
    super.postType,
    super.condition,
    super.planId,
    this.type,
    this.brand,
  });

  factory ElectronicHomeAppliancesPostModel.fromJson(Map<String, dynamic> json) {
    return ElectronicHomeAppliancesPostModel(
      catId: json['catId'],
      subcatId: json['subcatId'],
      userId: json['userId'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      location: json['location'],
      sublocation: json['sublocation'],
      mainImage: json['mainImage'],
      subImages1: json['subImages1'],
      subImages2: json['subImages2'],
      subImages3: json['subImages3'],
      subImages4: json['subImages4'],
      priceType: json['price_type'],
      postType: json['post_type'],
      condition: json['condition'],
      planId: json['plan_id'],
      type: json['type'],
      brand: json['brand'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['type'] = type;
    data['brand'] = brand;
    data['subImages1'] = subImages1;
    data['subImages2'] = subImages2;
    data['subImages3'] = subImages3;
    data['subImages4'] = subImages4;
    return data;
  }
}

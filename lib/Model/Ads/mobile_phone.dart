
import 'package:classic_ads/Model/Ads/base_model.dart';

class MobilePhonePostModel extends BasePostModel {
  int? brand;
  int? model;
   Set<String>? specialization;

  MobilePhonePostModel({
    super.catId,
    super.subcatId,
    super.userId,
    required super.title,
    required super.price,
    required super.description,
    super.location,
    super.sublocation,
    required super.mainImage,
    super.priceType,
    super.postType,
    this.brand,
    this.model,
    this.specialization,
  });

  factory MobilePhonePostModel.fromJson(Map<String, dynamic> json) {
    return MobilePhonePostModel(
      catId: json['catId'],
      subcatId: json['subcatId'],
      userId: json['userId'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      location: json['location'],
      sublocation: json['sublocation'],
      mainImage: json['mainImage'],
      priceType: json['price_type'],
      postType: json['post_type'],
      brand: json['brand'],
      model: json['model'],
      specialization: json['specialization'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['brand'] = brand;
    data['model'] = model;
    data['specialization'] =specialization?.toList();
    return data;
  }
}
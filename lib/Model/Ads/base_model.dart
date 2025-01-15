class BasePostModel {
  int? catId;
  int? subcatId;
  int? userId;
  String title;
  double price;
  String description;
  int? location;
  int? sublocation;
  String? mainImage;
  // List<String>? subImages;
  String? subImages1;
  String? subImages2;
  String? subImages3;
  String? subImages4;
  String? priceType;
  String? postType;
  int? planId;
  String condition;

  /////////
  ///

  BasePostModel({
    this.catId,
    this.subcatId,
    this.userId,
    required this.title,
    required this.price,
    required this.description,
    this.location,
    this.sublocation,
    required this.mainImage,
    // this.subImages,
    this.subImages1,
    this.subImages2,
    this.subImages3,
    this.subImages4,

    this.priceType,
    this.postType,
    this.planId,
    this.condition = 'New',
  });

  Map<String, dynamic> toJson() {
    return {
      'catId': catId,
      'subcatId': subcatId,
      'userId': userId,
      'title': title,
      'price': price,
      'description': description,
      'location': location,
      'sublocation': sublocation,
      'mainImage': mainImage,
      // 'subImages': subImages,

      'subImages1': subImages1,
      'subImages2': subImages2,
      'subImages3': subImages3,
      'subImages4': subImages4,

      'price_type': priceType,
      'post_type': postType,
      'plan_id': 0,
      'condition': condition,
    };
  }
}

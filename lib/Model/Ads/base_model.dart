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
  List<String> subImages;
  String? priceType;
  String? postType;
  int? planId;
  String condition;
  
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
    this.subImages = const [],
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
      'subImages': subImages,
      'price_type': priceType,
      'post_type': postType,
      'plan_id': planId,
      'condition': condition,
    };
  }
}




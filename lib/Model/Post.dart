import 'package:classic_ads/Model/MainCategory.dart';
import 'package:classic_ads/Model/SubCategory.dart';

class Post {
  final int id;
  final String adsId;
  final String title;
  final String url;
  final int location;
  final int sublocation;
  final String description;
  final String price;
  final String mainImage;
  final String subImage;
  final int catId;
  final int subCatId;
  final int userId;
  final dynamic adsPackage;
  final dynamic packageType;
  final dynamic packageExpireAt;
  // final String bumpUpAt;
  final String viewCountr;
  final String clickCountr;
  final dynamic priceType;
  final dynamic postType;
  final int status;
  final String createdAt;
  final String updatedAt;
  final MainLocation mainLocation;
  final SubLocation subLocation;
  final MainCategory category;
  final SubCategory subcategory;

  Post({
    required this.id,
    required this.adsId,
    required this.title,
    required this.url,
    required this.location,
    required this.sublocation,
    required this.description,
    required this.price,
    required this.mainImage,
    required this.subImage,
    required this.catId,
    required this.subCatId,
    required this.userId,
    required this.adsPackage,
    required this.packageType,
    required this.packageExpireAt,
    // required this.bumpUpAt,
    required this.viewCountr,
    required this.clickCountr,
    required this.priceType,
    required this.postType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.mainLocation,
    required this.subLocation,
    required this.category,
    required this.subcategory,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
   return Post(
      id: json['id'] != null ? int.parse(json['id'].toString()) : 0,
      adsId: json['adsId'],
      title: json['title'],
      url: json['url'],
      location: json['location'] != null ? int.parse(json['location'].toString()) : 0,
      sublocation: json['sublocation'] != null ? int.parse(json['sublocation'].toString()) : 0,
      description: json['description'],
      price: json['price'],
      mainImage: json['mainImage'],
      subImage: json['subImage'],
      catId: json['cat_id'] != null ? int.parse(json['cat_id'].toString()) : 0,
      subCatId: json['sub_cat_id'] != null ? int.parse(json['sub_cat_id'].toString()) : 0,
      userId: json['user_id'] != null ? int.parse(json['user_id'].toString()) : 0,
      adsPackage: json['ads_package'],
      packageType: json['package_type'],
      packageExpireAt: json['package_expire_at'],
      // bumpUpAt: json['bump_up_at'],
      viewCountr: json['view_counr'],
      clickCountr: json['click_counr'],
      priceType: json['price_type'],
      postType: json['post_type'],
      status: json['status'] != null ? int.parse(json['status'].toString()) : 0,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      mainLocation: MainLocation.fromJson(json['main_location']),
      subLocation: SubLocation.fromJson(json['sub_location']),
      category: MainCategory.fromJson(json['category']),
      subcategory: SubCategory.fromJson(json['subcategory']),
    );
  }
}

class MainLocation {
  final int id;
  final String url;
  final int provinceId;
  final String nameEn;
  final String nameSi;
  final String nameTa;

  MainLocation({
    required this.id,
    required this.url,
    required this.provinceId,
    required this.nameEn,
    required this.nameSi,
    required this.nameTa,
  });

  factory MainLocation.fromJson(Map<String, dynamic> json) {
   return MainLocation(
      id: json['id'] != null ? int.parse(json['id'].toString()) : 0,
      url: json['url'],
      provinceId: json['province_id'] != null ? int.parse(json['province_id'].toString()) : 0,
      nameEn: json['name_en'],
      nameSi: json['name_si'],
      nameTa: json['name_ta'],
    );
  }
}

class SubLocation {
  final int id;
  final int districtId;
  final String nameEn;
  final dynamic nameSi;
  final dynamic nameTa;
  final dynamic subNameEn;
  final dynamic subNameSi;
  final dynamic subNameTa;
  final String postcode;
  final String latitude;
  final String longitude;

  SubLocation({
    required this.id,
    required this.districtId,
    required this.nameEn,
    required this.nameSi,
    required this.nameTa,
    required this.subNameEn,
    required this.subNameSi,
    required this.subNameTa,
    required this.postcode,
    required this.latitude,
    required this.longitude,
  });

  factory SubLocation.fromJson(Map<String, dynamic> json) {
   return SubLocation(
      id: json['id'] != null ? int.parse(json['id'].toString()) : 0,
      districtId: json['district_id'] != null ? int.parse(json['district_id'].toString()) : 0,
      nameEn: json['name_en'],
      nameSi: json['name_si'],
      nameTa: json['name_ta'],
      subNameEn: json['sub_name_en'],
      subNameSi: json['sub_name_si'],
      subNameTa: json['sub_name_ta'],
      postcode: json['postcode'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

// class Category {
//   final int id;
//   final int mainId;
//   final String name;
//   final String url;
//   final dynamic description;
//   final String image;
//   final int status;
//   final String createdAt;
//   final String updatedAt;

//   Category({
//     required this.id,
//     required this.mainId,
//     required this.name,
//     required this.url,
//     required this.description,
//     required this.image,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       id: json['id'],
//       mainId: json['mainId'],
//       name: json['name'],
//       url: json['url'],
//       description: json['description'],
//       image: json['image'],
//       status: json['status'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }
// }

// class Subcategory {
//   final int id;
//   final int mainId;
//   final String name;
//   final String url;
//   final dynamic description;
//   final String image;
//   final int status;
//   final String createdAt;
//   final String updatedAt;

//   Subcategory({
//     required this.id,
//     required this.mainId,
//     required this.name,
//     required this.url,
//     required this.description,
//     required this.image,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Subcategory.fromJson(Map<String, dynamic> json) {
//     return Subcategory(
//       id: json['id'],
//       mainId: json['mainId'],
//       name: json['name'],
//       url: json['url'],
//       description: json['description'],
//       image: json['image'],
//       status: json['status'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }
// }
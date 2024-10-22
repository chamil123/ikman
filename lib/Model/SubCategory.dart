class SubCategory {
  final int id;
  final String mainId;
  final String name;
  final String url;
  final String? description;
  final String image;
  final int status;
  final String createdAt;
  final String updatedAt;

  SubCategory({
    required this.id,
    required this.mainId,
    required this.name,
    required this.url,
    this.description,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      mainId: json['mainId'].toString(),
      name: json['name'],
      url: json['url'],
      description: json['description'],
      image: json['image'],
      status: json['status']!=null?int.parse(json['status'].toString()):0,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
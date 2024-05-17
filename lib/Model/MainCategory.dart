class MainCategory {
  final int id;
  final String mainId;
  final String name;
  final String url;
  final String? description;
  final String image;
  final String status;
  final String createdAt;
  final String updatedAt;

  MainCategory({
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

  factory MainCategory.fromJson(Map<String, dynamic> json) {
    return MainCategory(
      id: json['id'],
      mainId: json['mainId'].toString(),
      name: json['name'],
      url: json['url'],
      description: json['description'],
      image: json['image'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
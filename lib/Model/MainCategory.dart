class MainCategory {
  final int id;
  final String mainId;
  final int free_add_count;
  final String name;
  final String url;
  final String? description;
  final String image;
  final int status;
  final String createdAt;
  final String updatedAt;

  MainCategory({
    required this.id,
    required this.mainId,
    required this.free_add_count,
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
       free_add_count: json['free_add_count']!=null?int.parse(json['free_add_count'].toString()):0,
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
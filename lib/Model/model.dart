class Model {
  final int id;
  final String brandsId;
  final String name;
  final String sub_cat_id;
  final String status;

  Model(
      {required this.id,
      required this.brandsId,
      required this.name,
      required this.sub_cat_id,
      required this.status});
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'],
      brandsId: json['brandsId'],
      name: json['name'],
      sub_cat_id: json['sub_cat_id'],
      status: json['status'],
    );
  }
}

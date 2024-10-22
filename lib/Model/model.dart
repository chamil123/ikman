class Model {
  final int id;
  final int brandsId;
  final String name;
  final int sub_cat_id;
  final int status;

  Model(
      {required this.id,
      required this.brandsId,
      required this.name,
      required this.sub_cat_id,
      required this.status});
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'],
      brandsId:json['brandsId'] != null ? int.parse(json['brandsId'].toString()) : 0,
      name: json['name'],
      sub_cat_id: json['sub_cat_id'] != null ? int.parse(json['sub_cat_id'].toString()) : 0,
      status: json['status'] != null ? int.parse(json['status'].toString()) : 0,
    );
  }
}

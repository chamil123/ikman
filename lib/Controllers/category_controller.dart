import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:classic_ads/Model/MainCategory.dart';
import 'package:classic_ads/Model/Post.dart';
import 'package:classic_ads/Model/SubCategory.dart';
import '../../utils/strings.dart';

class CategoryController {
  Future<List<MainCategory>> fetchCategories() async {
    const apiUrl = baseUrl+'api/main-categories';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['status'] == true) {
        final categories = (jsonData['categories'] as List)
            .map((data) => MainCategory.fromJson(data))
            .toList();
        return categories;
      } else {
        throw Exception('Failed to fetch categories');
      }
    } else {
      throw Exception('Failed to fetch categories');
    }
  }
  Future<List<SubCategory>> fetchSubCategories(int cat_id) async {
    final apiUrl = baseUrl+'api/sub-categories/'+cat_id.toString();
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['status'] == true) {
        final subCategories = (jsonData['categories'] as List)
            .map((data) => SubCategory.fromJson(data))
            .toList();
        return subCategories;
      } else {
        throw Exception('Failed to fetch categories');
      }
    } else {
      throw Exception('Failed to fetch categories');
    }
  }
}

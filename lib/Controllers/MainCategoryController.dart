import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ikman/Model/MainCategory.dart';
import 'package:ikman/Model/Post.dart';

class MainCategoryController {
  Future<List<MainCategory>> fetchCategories() async {
    const apiUrl = 'https://demo.satasmewebdev.online/api/main-categories';
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
}

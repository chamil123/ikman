import 'dart:convert';
import 'package:classic_ads/Model/District%20.dart';
import 'package:http/http.dart' as http;
import 'package:classic_ads/Model/MainCategory.dart';
import 'package:classic_ads/Model/Post.dart';
import 'package:classic_ads/Model/SubCategory.dart';
import '../../utils/strings.dart';

class LocationController {
  Future<List<MainCategory>> fetchCategories() async {
    const apiUrl = baseUrl+'api/districts';
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
  Future<List<District>> fetchDistricts() async {
    const apiUrl = baseUrl + 'api/districts';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['status'] == true) {
        final districts = (jsonData['data'] as List)
            .map((data) => District.fromJson(data))
            .toList();
        return districts;
      } else {
        throw Exception('Failed to fetch districts');
      }
    } else {
      throw Exception('Failed to fetch districts');
    }
  }
}

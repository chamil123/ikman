import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:classic_ads/Model/MainCategory.dart';
import '../../utils/strings.dart';
import '../Model/brand.dart';

class BrandController {
  Future<List<Brand>> fetchBrands(int id) async {
    final apiUrl = baseUrl + 'api/brands/${id}';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['status'] == true) {
        final brand = (jsonData['data'] as List)
            .map((data) => Brand.fromJson(data))
            .toList();
        return brand;
      } else {
        throw Exception('Failed to fetch brand');
      }
    } else {
      throw Exception('Failed to fetch brand');
    }
  }
}

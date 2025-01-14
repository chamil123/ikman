import 'dart:convert';
import 'package:classic_ads/utils/strings.dart';
import 'package:http/http.dart' as http;
import 'package:classic_ads/Model/Post.dart';

class ApiService {
  int currentPage = 1;
  Future<List<Post>> getPosts(int currentPage) async {
    final response = await http.get(Uri.parse(baseUrl+ 'public/api/all-ads/10?page=$currentPage'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> postData = jsonData['data']['data'];
      return postData.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}

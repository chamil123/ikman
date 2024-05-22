import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:classic_ads/Model/Post.dart';

class ApiService {
  // final String _baseUrl = 'https://jsonplaceholder.typicode.com';

Future<List<Post>> getPosts() async {
  final response = await http.get(Uri.parse('https://demo.satasmewebdev.online/public/api/all-ads'));
  print('Response status code: ${response.statusCode}');

   if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final List<dynamic> postData = jsonData['data'];

print(postData);
    return postData.map((json) {
      return Post.fromJson(json);
    }).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}
}
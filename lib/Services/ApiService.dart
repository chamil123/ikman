import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ikman/Model/Post.dart';

class ApiService {
  // final String _baseUrl = 'https://jsonplaceholder.typicode.com';

Future<List<Post>> getPosts() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1/photos'));
  print('Response status code: ${response.statusCode}');

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body);
    print('Received data: $jsonData');
    return jsonData.map((json) {
      return Post.fromJson(json);
    }).toList();
  } else {
    print('Error: ${response.reasonPhrase}'); // Add this line
    throw Exception('Failed to load posts');
  }
}
}
import '../Model/model.dart';
import 'dart:convert';
import '../../utils/strings.dart';
import 'package:http/http.dart' as http;
class ModelController{
  Future<List<Model>> fetchModel(int id)async{
     final apiUrl = baseUrl + 'api/models/${id}';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['status'] == true) {
        final model = (jsonData['data'] as List)
            .map((data) => Model.fromJson(data))
            .toList();
        return model;
      } else {
        throw Exception('Failed to fetch model');
      }
    } else {
      throw Exception('Failed to fetch model');
    }
  }
}
import 'dart:convert';

import '../Model/Ads/base_model.dart';
import '../utils/strings.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class AdsController {
  Future postAd(BasePostModel data) async {
    final apiUrl = baseUrl + 'api/ads/post';

    try {
      // Create multipart request
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Add text fields from data
      Map<String, dynamic> jsonData = data.toJson();
      jsonData.forEach((key, value) {
        if (value != null &&
            key != 'mainImage' &&
            key != 'subImages1' &&
            key != 'subImages2' &&
            key != 'subImages3' &&
            key != 'subImages4') {
          request.fields[key] = value.toString();
        }
      });

      // Add main image
      if (data.mainImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'mainImage',
          data.mainImage!,
          contentType: MediaType('image', 'jpeg'),
        ));
      }

      // Add sub images if they exist
      if (data.subImages1 != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'subImage1',
          data.subImages1!,
          contentType: MediaType('image', 'jpeg'),
        ));
      }
      if (data.subImages2 != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'subImage2',
          data.subImages2!,
          contentType: MediaType('image', 'jpeg'),
        ));
      }
      if (data.subImages3 != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'subImage3',
          data.subImages3!,
          contentType: MediaType('image', 'jpeg'),
        ));
      }
      if (data.subImages4 != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'subImage4',
          data.subImages4!,
          contentType: MediaType('image', 'jpeg'),
        ));
      }

      // Send the request
      var response = await request.send();
      var responseData = await response.stream.bytesToString();
        final json_ata = json.decode(responseData);
      if (response.statusCode == 200) {

        print("Response: " + json_ata.toString());
        return json_ata;
      } else {
        print("Error response: " +  responseData);
        // throw Exception('Failed to post ad. Status code: ${response.statusCode}');
        return json_ata;
      }
    } catch (e) {
      print('Error posting ad: $e');
      throw Exception('Error posting ad: $e');
    }
  }
}

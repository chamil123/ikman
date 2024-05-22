import 'package:flutter/material.dart';
import 'package:classic_ads/Model/Post.dart';
import 'package:classic_ads/Services/ApiService.dart';

class AdsProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Post> _posts = [];
  bool _isLeftIconSelected = true;
  bool _isRightIconSelected = false;

  List<Post> get getPosts => _posts;
  bool get isLeftIconSelected => _isLeftIconSelected;
  bool get isRightIconSelected => _isRightIconSelected;

  Future<void> fetchPosts() async {
    try {
      print('Fetching posts...');
      _posts = await _apiService.getPosts();
      
      print('Fetched posts: $_posts');
      notifyListeners();
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }

  setPrint() {
    print(_posts.toString());
  }

  void toggleSelection(value) {
    if (value == "Left") {
      _isLeftIconSelected = true;
      _isRightIconSelected = false;
    } else if(value == "Right") {
      _isRightIconSelected = true;
      _isLeftIconSelected = false;
    }
    notifyListeners();
  }
}

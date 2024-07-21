import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:classic_ads/Model/Post.dart';
import 'package:classic_ads/Services/ApiService.dart';

import '../Model/District .dart';
import '../Model/MainCategory.dart';
import '../Model/SubCategory.dart';

class AdsProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  int _currentPage = 1;
  bool _isLoadingMore = false;
  List<Post> _posts = [];
  bool _isLeftIconSelected = true;
  bool _isRightIconSelected = false;
  MainCategory? _category;
  SubCategory? _subCategory = null;
  District? _distric = null;
  bool _isLocation = false;

  List<Post> get getPosts => _posts;
  bool get isLeftIconSelected => _isLeftIconSelected;
  bool get isRightIconSelected => _isRightIconSelected;

  int get currentPage => _currentPage;
  bool get isLoadingMore => _isLoadingMore;
  MainCategory? get getSelectedCaegory => _category;
  SubCategory? get getSubCategory => _subCategory;
  bool get isLocation => _isLocation;
  District? get getdistric => _distric;

  Future<void> fetchPosts() async {
    if (_isLoadingMore) return;
    try {
      _isLoadingMore = true;
      print('Fetching posts...');
      List<Post> newPosts = await _apiService.getPosts(_currentPage);
      _posts.addAll(newPosts);
      _currentPage++;
      print('Fetched posts: $_posts');
    } catch (e) {
      print('Error fetching posts: $e');
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  setPrint() {
    print(_posts.toString());
  }

  void toggleSelection(value) {
    if (value == "Left") {
      _isLeftIconSelected = true;
      _isRightIconSelected = false;
    } else if (value == "Right") {
      _isRightIconSelected = true;
      _isLeftIconSelected = false;
    }
    notifyListeners();
  }

  void selectedCategory(MainCategory category, [bool isLocation = false]) {
    _category = category;
    _isLocation = isLocation;
    notifyListeners();
  }

  void selectedSubCategory(SubCategory subCategory) {
    _subCategory = subCategory;
    notifyListeners();
  }

  void selectedDistrict(District distric) {
    _distric = distric;
    notifyListeners();
  }

  void setIsLocation([bool isLocation = false] ) {
    _isLocation = isLocation;
    print(">>>>>>>>>>SSSSSSSSS : "+_isLocation.toString());
    notifyListeners();
  }
}

import 'package:classic_ads/Controllers/model_controller.dart';
import 'package:classic_ads/Model/brand.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:classic_ads/Model/Post.dart';
import 'package:classic_ads/Services/ApiService.dart';

import '../Controllers/brand_controller.dart';
import '../Model/Ads/base_model.dart';
import '../Model/District .dart';
import '../Model/MainCategory.dart';
import '../Model/SubCategory.dart';
import '../Model/city.dart';
import '../Model/model.dart';

class AdsProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final BrandController _controller = BrandController();
  final ModelController _modelController = ModelController();
  int _currentPage = 1;
  bool _isLoadingMore = false;
  List<Post> _posts = [];
  List<Brand> _brand = [];
  List<Model> _model = [];
  bool _isLeftIconSelected = true;
  bool _isRightIconSelected = false;
  MainCategory? _category;
  SubCategory? _subCategory = null;
  District? _distric = null;
  City? _city = null;
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
  City? get getCity => _city;
  List<Brand> get getBrand => _brand;
  List<Model> get getModel => _model;

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

  Future<void> fetchBrands() async {
    if (_isLoadingMore) return;
    try {
      _isLoadingMore = true;
      print('Fetching brand...');
      List<Brand> brand = await _controller.fetchBrands( _subCategory!.id);
      _brand.addAll(brand);
      print('Fetched brand: $_posts');
    } catch (e) {
      print('Error fetching brand: $e');
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  Future<void> fetchModel() async {
    if (_isLoadingMore) return;
    try {
      _isLoadingMore = true;
      print('Fetching model...');
      List<Model> model = await _modelController.fetchModel(_subCategory!.id);
      _model.addAll(model);
      print('Fetched model: $_posts');
    } catch (e) {
      print('Error fetching model: $e');
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

  void selectedCategory(MainCategory category) {
    _category = category;
    // _isLocation = isLocation;
    notifyListeners();
  }

  void selectedSubCategory(SubCategory subCategory) {
    _subCategory = subCategory;
    notifyListeners();
  }

  void selectedDistrict(District distric, City city) {
    _distric = distric;
    _city = city;
    notifyListeners();
  }

  void setIsLocation([bool isLocation = false]) {
    _isLocation = isLocation;
    print(">>>>>>>>>>SSSSSSSSS : " + _isLocation.toString());
    notifyListeners();
  }

  Future<void> addAd(BasePostModel data) async {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> OOOOOO : " +
        data.toString());
    print(data.toJson().toString());
  }
}

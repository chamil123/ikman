import 'package:flutter/material.dart';
import 'package:classic_ads/Controllers/category_controller.dart';
import 'package:classic_ads/Model/MainCategory.dart';
import 'package:classic_ads/Model/SubCategory.dart';


class CategoryProvider extends ChangeNotifier {
  final CategoryController _controller = CategoryController();
  List<MainCategory> _categories = [];
    List<SubCategory> _subCategories = [];
  bool _isLoading=false;
  // List<>

  List<MainCategory> get categories => _categories;
    List<SubCategory> get subCategories => _subCategories;
  bool get isLoading=>_isLoading;

  Future<void> fetchCategories() async {
     _isLoading = true;
    try {
      _categories = await _controller.fetchCategories();
      _isLoading = false;
      notifyListeners();

    } catch (e) {
            _isLoading = false;
      print('Error fetching categories: $e');
    }
  }
  Future<void> fetcSubCategories(int catId)async{
     _isLoading = true;
    try {
      _subCategories = await _controller.fetchSubCategories(catId);
      _isLoading = false;
      notifyListeners();

    } catch (e) {
            _isLoading = false;
      print('Error fetching categories: $e');
    }
  }
}
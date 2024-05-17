import 'package:flutter/material.dart';
import 'package:ikman/Controllers/MainCategoryController.dart';
import 'package:ikman/Model/MainCategory.dart';


class MainCategorProvider extends ChangeNotifier {
  final MainCategoryController _controller = MainCategoryController();
  List<MainCategory> _categories = [];
  // List<>

  List<MainCategory> get categories => _categories;

  Future<void> fetchCategories() async {
    try {
      _categories = await _controller.fetchCategories();
      notifyListeners();
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }
  Future<void> fetcSubCategories()async{
    try {
      
    } catch (e) {
        print('Error fetching categories: $e');
    }
  }
}
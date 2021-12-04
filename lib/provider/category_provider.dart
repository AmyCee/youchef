import 'package:flutter/cupertino.dart';
import 'package:you_chef/models/category/category_data.dart';

class CategoryProvider extends ChangeNotifier{
  List<CategoryData> categoryList = [];
  bool addCategory = false;

  void addCategories(CategoryData categoryData){
    categoryList.add(categoryData);
    notifyListeners();
  }
}
import 'package:flutter/cupertino.dart';
import 'package:you_chef/models/category/category_data.dart';
import 'package:you_chef/models/recipe/recipe_data.dart';

class RecipeProvider extends ChangeNotifier{
  bool addRecipe = false;
  CategoryData? selectedCategory;

  void selectCategory(CategoryData categoryData){
    selectedCategory = categoryData;
    notifyListeners();
  }


  void addRecipes(RecipeData recipeData){
    selectedCategory!.addRecipe(recipeData);
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:you_chef/models/recipe/recipe_data.dart';

class CategoryData {
  String? categoryName;
  String? description;
  String? image;
  List<RecipeData>? recipes;

  CategoryData({
    this.description,
    this.image,
    this.categoryName,
    this.recipes
  });

  void addRecipe(RecipeData recipe){
    if (recipes != null) {
      recipes!.add(recipe);
    }
    else {
      recipes = [];
      recipes!.add(recipe);
    }
  }
}




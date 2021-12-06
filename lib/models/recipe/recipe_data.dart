 import 'package:flutter/material.dart';

class RecipeData {
  String? recipeName;
  String? description;
  String? image;
 List<String>? instructions;
  List<String>? ingredients;

  RecipeData({
    this.description,
    this.image,
    this.recipeName,
    this.instructions,
    this.ingredients,
  });
}



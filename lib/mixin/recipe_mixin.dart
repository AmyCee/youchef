import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_chef/models/category/category_data.dart';
import 'package:you_chef/models/recipe/recipe_data.dart';
import 'package:you_chef/provider/recipe_provider.dart';

mixin RecipeMixin{
  BuildContext? _mixinContext;

  void addRecipe(BuildContext context, RecipeData recipeData) {
    _mixinContext = context;
    Provider.of<RecipeProvider>(_mixinContext!, listen: false).addRecipes(recipeData);
  }
}
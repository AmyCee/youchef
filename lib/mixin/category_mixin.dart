import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_chef/provider/category_provider.dart';
import 'package:you_chef/models/category/category_data.dart';

mixin CategoryMixin{
  BuildContext? _mixinContext;

  void addCategory(BuildContext context, CategoryData categoryData) {
    _mixinContext = context;
    Provider.of<CategoryProvider>(_mixinContext!, listen: false).addCategories(
        categoryData);

    print("Added Category: ${Provider
        .of<CategoryProvider>(_mixinContext!, listen: false)
        .categoryList}");
  }
}

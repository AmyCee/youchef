import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_chef/provider/recipe_provider.dart';
import 'package:you_chef/utils/hex_color.dart';

class RecipeInfo extends StatefulWidget {
  const RecipeInfo({Key? key}) : super(key: key);

  @override
  _RecipeInfoState createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<RecipeInfo> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(provider.selectedCategory?.categoryName ?? "",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black87,
                  fontFamily: "Capriola-Regular",),
              ),
              backgroundColor: HexColor('A9E07E'),
              //elevation: 0.0,
            ),
          );
        });
  }
}
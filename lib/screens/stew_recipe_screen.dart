import 'package:flutter/material.dart';
import 'package:you_chef/models/category/category_data.dart';
import 'package:you_chef/models/recipe/recipe_data.dart';
import 'package:you_chef/models/recipe/recipe_ui.dart';
import 'package:you_chef/provider/category_provider.dart';
import 'package:you_chef/provider/recipe_provider.dart';
import 'package:you_chef/screens/add_recipe.dart';
import 'package:you_chef/screens/add_category.dart';
import 'package:you_chef/utils/hex_color.dart';
import 'package:provider/provider.dart';

class StewRecipe extends StatefulWidget {
  const StewRecipe({Key? key}) : super(key: key);

  @override
  _StewRecipeState createState() => _StewRecipeState();
}

class _StewRecipeState extends State<StewRecipe> {
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
            body: Container(
              child: ListView.builder(
                  itemCount: provider.selectedCategory?.recipes?.length ?? 0,
                  itemBuilder: (context, index) {
                    return RecipeUi(recipe: provider.selectedCategory?.recipes?[index] ?? RecipeData());
                  }),
            ),
            floatingActionButton: SizedBox(
              height: 80,
              width: 80,
              child: new FloatingActionButton(
                // isExtended: true,
                  child: Icon(Icons.add, color: Colors.black54, size: 35.0,),
                  backgroundColor: HexColor('A9E07E'),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddRecipe()),
                    );
                  }),
            ),
          );
        }
        );
   }
  }

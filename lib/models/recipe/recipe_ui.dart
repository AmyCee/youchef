import 'dart:io';

import 'package:flutter/material.dart';
import 'package:you_chef/models/recipe/recipe_data.dart';
import 'package:you_chef/screens/recipe_info.dart';

class RecipeUi extends StatelessWidget {
  RecipeData recipe;

  RecipeUi({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
          fit: BoxFit.cover,
          image: FileImage(File(recipe.image!)),
        ),
      ),
      child: MaterialButton(
        onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => RecipeInfo()),
          );
        },
        minWidth: MediaQuery.of(context).size.width * 0.8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(recipe.recipeName!, style: TextStyle(color: Colors.white, backgroundColor: Colors.black26),),
        ),
      ),
    );
  }
}


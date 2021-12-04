import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_chef/models/category/category_data.dart';
import 'package:you_chef/provider/recipe_provider.dart';
import 'package:you_chef/screens/add_recipe.dart';
import 'package:you_chef/screens/stew_recipe_screen.dart';

class CategoryUi extends StatelessWidget {
  CategoryData category;

  CategoryUi({Key? key, required this.category}) : super(key: key);

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
            image: FileImage(File(category.image!)),
         ),
        ),
        child: MaterialButton(
          onPressed: (){
            Provider.of<RecipeProvider>(context, listen: false).selectCategory(category);
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => StewRecipe()),
            );
          },
          minWidth: MediaQuery.of(context).size.width * 0.8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
           child: Column(
             children: [

               Container(
                  padding: EdgeInsets.all(20),
                  child: Text(category.categoryName!, style: TextStyle(color: Colors.white, backgroundColor: Colors.black26, fontSize: 30),),
               ),
               Container(
                 padding: EdgeInsets.all(20),
                 child: Text(category.description!, style: TextStyle(color: Colors.white70, backgroundColor: Colors.black26),),
               ),
             ],
           ),
        ),
      );
   }
  }


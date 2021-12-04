import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:you_chef/models/category/category_data.dart';
import 'package:you_chef/models/category/category_ui.dart';
import 'package:you_chef/provider/category_provider.dart';
import 'package:you_chef/screens/add_category.dart';
import 'package:you_chef/screens/stew_recipe_screen.dart';
import 'package:you_chef/utils/hex_color.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);


  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Categories',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black87,
                  fontFamily: "Capriola-Regular",),
              ),
              backgroundColor: HexColor('A9E07E'),
              //elevation: 0.0,
            ),
            body: Container(
              child: ListView.builder(
                  itemCount: provider.categoryList.length,
                  itemBuilder: (context, index){
                    return CategoryUi(category: provider.categoryList[index]);
                  }),
            ),
            //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: SizedBox(
              height: 80,
              width: 80,
              child: new FloatingActionButton(
                // isExtended: true,
                  child: Icon(Icons.add, color: Colors.black54, size: 35.0,),
                  backgroundColor: HexColor('A9E07E'),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddCat()),
                    );
                  }),
            ),
          );
        }
      );
  }
}



import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_chef/models/recipe/recipe_data.dart';
import 'package:you_chef/provider/recipe_provider.dart';
import 'package:you_chef/utils/hex_color.dart';

class RecipeInfo extends StatefulWidget {
  RecipeData recipe;
   RecipeInfo({Key? key, required this.recipe}) : super(key: key);

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
              title: Text(widget.recipe.recipeName!,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black87,
                  fontFamily: "Capriola-Regular",),
              ),
              backgroundColor: HexColor('A9E07E'),
              //elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    //Text(response.title!, textScaleFactor: 1.0, style: TextStyle(fontSize: 24) ),
                    SizedBox(height: 20,),
                    // Text("Ingredients", textScaleFactor: 1.0, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ),
                    Accordion(
                        children: [
                          AccordionSection(
                            header: Text("Ingredients", textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),),
                            content: Container(
                                padding: EdgeInsets.all(16.0),
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.3,
                                child: ListView(children: widget.recipe.ingredients!.map((
                                    word) =>
                                    ListTile(leading: Icon(Icons.add),
                                        title: Text(word))).toList())
                            ),
                          ),
                          AccordionSection(
                            header: Text("Instructions", textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),),
                            content: Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.3,
                              child: ListView.builder(
                                  itemCount: widget.recipe.instructions!.length,
                                  itemBuilder: (context, int index) {
                                    return ListTile(leading: Icon(Icons.add_task),
                                        title: Text(widget.recipe.instructions![index]));
                                  }),
                            ),)
                        ]
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(16.0),
                    //   height: MediaQuery.of(context).size.height * 0.4,
                    //   child: ListView(children: response.ingredients!.map((word)=> Text(word)).toList())
                    // ),
                    // SizedBox(height: 20,),
                    // Text("Instructions", textScaleFactor: 1.0, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height * 0.4,
                    //   child: ListView.builder(
                    //     itemCount: response.instructions!.length,
                    //     itemBuilder: (context, int index){
                    //       return Text(response.instructions![index].text!);
                    //     }),
                    // ),
                    // ListView(children: response.instructions!.map((word)=> Text()).toList())
                  ],
                ),
              ),
            ),
          );
        });
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_chef/provider/category_provider.dart';
import 'package:you_chef/provider/recipe_provider.dart';
import 'package:you_chef/screens/splashscreen.dart';
import 'package:you_chef/utils/hex_color.dart';

void main() {
  runApp(const YouChef());
}

class YouChef extends StatelessWidget {

  const YouChef({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => RecipeProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,

          primarySwatch: mainSwatch,
        ),
        home: MySplashScreen(),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'dart:async';
import 'package:you_chef/screens/onboarding_1.dart';
import 'package:you_chef/screens/onboarding_2.dart';
import 'package:you_chef/screens/onboarding_3.dart';
import 'package:you_chef/utils/hex_color.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OnboardingScreen_1())));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: HexColor('A9E07E'),
          body: Center(
               child: Image.asset('assets/images/you_chef_logo.png'),
              ),
    );
  }
}

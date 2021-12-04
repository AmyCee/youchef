import 'package:flutter/material.dart';
import 'package:you_chef/screens/onboarding_2.dart';
import 'package:you_chef/screens/onboarding_3.dart';
import 'package:you_chef/screens/splashscreen.dart';
import 'package:you_chef/utils/hex_color.dart';

// ignore: camel_case_types
class OnboardingScreen_1 extends StatelessWidget {
  const OnboardingScreen_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
         child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
           decoration: const BoxDecoration(
            image: DecorationImage(
            image: AssetImage("assets/images/jollof_rice.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken)
            )
           ),
           child: Column(
             children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Container(
                   margin: EdgeInsets.all(20),
                   height: 60,
                   child: Image.asset('assets/images/you_chef_logo.png'),
               ),
             ],
           ),
               SizedBox(height: 200,),
               Text('The easiest way to have fun cooking and organizing your recipes.',
                   style: TextStyle(
                       color: Colors.white54,
                       fontFamily: "NunitoSans-Italic",
                       fontSize: 25,
                       shadows: <Shadow>[
                   Shadow(
                   offset: Offset(0.0, 4.0),
                 blurRadius: 6.0,
                 color: Color.fromARGB(255, 0, 0, 0),
               ),
           ]
                   ),
                   textAlign: TextAlign.center,
               ),
               SizedBox(height: 250,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    height: 50,
                    minWidth: 100,
                    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OnboardingScreen_3()),
                      );
                    },
                    color: Colors.black12,
                    highlightElevation: 40,
                    child: Text('Skip',
                        style: TextStyle(
                            color: Colors.white70,
                            fontFamily: "Capriola-Regular",
                            fontSize: 20
                        )
                    ),
                  ),
                  SizedBox(width: 150,),
                  MaterialButton(
                    height: 50,
                    minWidth: 100,
                    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OnboardingScreen_2()),
                      );
                    },
                    color: HexColor('A9E07E'),
                    highlightElevation: 40,
                    child: Text('Next',
                        style: TextStyle(
                            color: Colors.white70,
                            fontFamily: "Capriola-Regular",
                            fontSize: 20
                        )
                    ),
                  ),
                ],
              )
             ],
           ),
          ),
        ),
    );
  }
}

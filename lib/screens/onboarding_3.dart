import 'package:flutter/material.dart';
import 'package:you_chef/screens/dashboard.dart';
import 'package:you_chef/screens/recipe_info.dart';
import 'package:you_chef/utils/hex_color.dart';

class OnboardingScreen_3 extends StatefulWidget {
  const OnboardingScreen_3({Key? key}) : super(key: key);

  @override
  _OnboardingScreen_3State createState() => _OnboardingScreen_3State();
}

class _OnboardingScreen_3State extends State<OnboardingScreen_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/couples_cooking.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
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
              Text('Create memories, share love, and of course, recipes with loved ones.',
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
                // softWrap: true,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 250,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 80,),
                  MaterialButton(
                    height: 50,
                    minWidth: 100,
                    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    },
                    color: HexColor('A9E07E'),
                    highlightElevation: 40,
                    child: Text('Get Started',
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
    );  }
}

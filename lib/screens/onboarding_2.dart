import 'package:flutter/material.dart';
import 'package:you_chef/screens/onboarding_3.dart';
import 'package:you_chef/utils/hex_color.dart';

class OnboardingScreen_2 extends StatefulWidget {
  const OnboardingScreen_2({Key? key}) : super(key: key);

  @override
  _OnboardingScreen_2State createState() => _OnboardingScreen_2State();
}

class _OnboardingScreen_2State extends State<OnboardingScreen_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/lady_cooking.png"),
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
              Text('The world’s going digital, and so are you. Create your own personal digital cookbook.',
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
                        MaterialPageRoute(builder: (context) => OnboardingScreen_3()),
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

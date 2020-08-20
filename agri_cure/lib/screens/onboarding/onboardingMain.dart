import 'package:agri_cure/screens/onboarding/onboarding1.dart';
import 'package:agri_cure/screens/onboarding/onboarding2.dart';
import 'package:flutter/material.dart';

class OnBoardingMain extends StatefulWidget {
  OnBoardingMain({Key key}) : super(key: key);

  @override
  _OnBoardingMainState createState() => _OnBoardingMainState();
}

class _OnBoardingMainState extends State<OnBoardingMain> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: PageView(
          children: <Widget>[Onboarding1(), Onboarding2(), Onboarding1()],
        ),
      ),
    );
  }
}

import 'package:agri_cure/providers/pageVIewProvider.dart';
import 'package:agri_cure/screens/onboarding/onboarding1.dart';
import 'package:agri_cure/screens/onboarding/onboarding2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingMain extends StatefulWidget {
  OnBoardingMain({Key key}) : super(key: key);

  @override
  _OnBoardingMainState createState() => _OnBoardingMainState();
}

class _OnBoardingMainState extends State<OnBoardingMain> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final PageViewProvider _pageViewProvider =
        Provider.of<PageViewProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: PageView(
          controller: _pageViewProvider.controller,
          children: <Widget>[
            Onboarding1(),
            Onboarding2(),
          ],
        ),
      ),
    );
  }
}

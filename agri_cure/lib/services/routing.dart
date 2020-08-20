import 'package:agri_cure/screens/Landing.dart';
import 'package:agri_cure/screens/onboarding/onboarding1.dart';
import 'package:agri_cure/screens/onboarding/onboardingMain.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class FluroRouter {
  static Router router = Router();

  static Handler _landingHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          Landing());
  static Handler _onboarding1Handler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          OnBoardingMain());
//-----------------------Routenames----------------------------------------//
  static void setupRouter() {
    router.define('/',
        handler: _landingHandler, transitionType: TransitionType.fadeIn);
    router.define('/onboardingMain',
        handler: _onboarding1Handler, transitionType: TransitionType.cupertino);
  }
}

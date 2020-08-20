import 'package:agri_cure/screens/AuthScreen.dart';
import 'package:agri_cure/screens/Landing.dart';
import 'package:agri_cure/screens/LoginScreen.dart';
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
  static Handler _authScreenHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          AuthScreen());
  static Handler _loginScreenHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          LoginScreen());
//-----------------------Routenames----------------------------------------//
  static void setupRouter() {
    router.define('/',
        handler: _landingHandler, transitionType: TransitionType.fadeIn);
    router.define('/onboardingMain',
        handler: _onboarding1Handler, transitionType: TransitionType.cupertino);
    router.define('/authScreen',
        handler: _authScreenHandler, transitionType: TransitionType.cupertino);
    router.define('/loginScreen',
        handler: _loginScreenHandler, transitionType: TransitionType.cupertino);
  }
}

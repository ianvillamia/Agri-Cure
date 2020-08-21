import 'package:agri_cure/screens/AuthScreen.dart';
import 'package:agri_cure/screens/Landing.dart';
import 'package:agri_cure/screens/LoginScreen.dart';

import 'package:agri_cure/screens/main/homeScreen.dart';
import 'package:agri_cure/screens/main/registerFarm.dart';
import 'package:agri_cure/screens/main/registerFarmerScreen.dart';
import 'package:agri_cure/screens/main/registerSuccessScreen.dart';
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
  static Handler _homeScreenHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          HomeScreen());
  static Handler _registerFarmerScreenHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          RegisterFarmerScreen());
  static Handler _registerFarmScreenHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          RegisterFarmScreen());
  static Handler _registerSuccessScreenHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          RegisterSuccessScreen());
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
    router.define('/homeScreen',
        handler: _homeScreenHandler, transitionType: TransitionType.cupertino);
    router.define('/registerFarmer',
        handler: _registerFarmerScreenHandler,
        transitionType: TransitionType.cupertino);
    router.define('/registerFarm',
        handler: _registerFarmScreenHandler,
        transitionType: TransitionType.cupertino);
    router.define('/registerSuccess',
        handler: _registerSuccessScreenHandler,
        transitionType: TransitionType.cupertino);
  }
}

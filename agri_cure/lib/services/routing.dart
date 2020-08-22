import 'package:agri_cure/screens/AuthScreen.dart';
import 'package:agri_cure/screens/Landing.dart';
import 'package:agri_cure/screens/LoginScreen.dart';
import 'package:agri_cure/screens/main/cropInventory/cropAdd.dart';
import 'package:agri_cure/screens/main/cropInventory/cropInventoryScreen.dart';
import 'package:agri_cure/screens/main/cropPickUp/cropPickup.dart';
import 'package:agri_cure/screens/main/cropPickUp/cropPickupSuccess.dart';

import 'package:agri_cure/screens/main/homeScreen.dart';
import 'package:agri_cure/screens/main/members/membersScreen.dart';
import 'package:agri_cure/screens/main/registerFarmer/registerFarm.dart';
import 'package:agri_cure/screens/main/registerFarmer/registerFarmerScreen.dart';
import 'package:agri_cure/screens/main/registerFarmer/registerSuccessScreen.dart';
import 'package:agri_cure/screens/main/transactions/transactionsScreen.dart';
import 'package:agri_cure/screens/onboarding/onboardingMain.dart';
import 'package:agri_cure/services/routes.dart';
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
  static Handler _membersScreenHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          MembersScreen());
  static Handler _cropPickupScreen = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          CropPickUp());
  static Handler _cropPickupSuccess = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          CropPickUpSuccess());
  static Handler _transactionsScreen = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          TransactionsScreen());
  static Handler _cropInventoryScreen = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          CropInventory());
  static Handler _addCropHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          CropAdd());
//-----------------------Routenames----------------------------------------//
  static void setupRouter() {
    router.define(Routes.def,
        handler: _landingHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.onboardingMain,
        handler: _onboarding1Handler, transitionType: TransitionType.cupertino);
    router.define(Routes.authScreen,
        handler: _authScreenHandler, transitionType: TransitionType.cupertino);
    router.define(Routes.loginScreen,
        handler: _loginScreenHandler, transitionType: TransitionType.cupertino);
    router.define(Routes.homeScreen,
        handler: _homeScreenHandler, transitionType: TransitionType.cupertino);
    router.define(Routes.registerFarmer,
        handler: _registerFarmerScreenHandler,
        transitionType: TransitionType.cupertino);
    router.define(Routes.registerFarm,
        handler: _registerFarmScreenHandler,
        transitionType: TransitionType.cupertino);
    router.define(Routes.registerSuccess,
        handler: _registerSuccessScreenHandler,
        transitionType: TransitionType.cupertino);
    router.define(Routes.membersScreen,
        handler: _membersScreenHandler,
        transitionType: TransitionType.cupertino);
    router.define(Routes.cropPickup,
        handler: _cropPickupScreen, transitionType: TransitionType.cupertino);
    router.define(Routes.cropPickUpSuccess,
        handler: _cropPickupSuccess, transitionType: TransitionType.cupertino);
    router.define(Routes.transactionScreen,
        handler: _transactionsScreen, transitionType: TransitionType.cupertino);
    router.define(Routes.cropInventory,
        handler: _cropInventoryScreen,
        transitionType: TransitionType.cupertino);
    router.define(Routes.addCrop,
        handler: _addCropHandler, transitionType: TransitionType.cupertino);
  }
}

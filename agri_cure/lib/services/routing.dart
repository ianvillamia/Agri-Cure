import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class FluroRouter {
  static Router router = Router();

  static Handler _homehandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          Home());

//-----------------------Routenames----------------------------------------//
  static void setupRouter() {
    router.define('/',
        handler: _wrapperHandler, transitionType: TransitionType.fadeIn);
  }
}

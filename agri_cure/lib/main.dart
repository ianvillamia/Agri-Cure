import 'package:agri_cure/splashscreen.dart';
import 'package:flutter/material.dart';
import 'services/routing.dart';
import 'screens/Landing.dart';

void main() {
  FluroRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriCure',
      onGenerateRoute: FluroRouter.router.generator,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreens(),
    );
  }
}

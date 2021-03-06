import 'package:agri_cure/screens/Landing.dart';
import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'screens/Landing.dart';

class SplashScreens extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  bool _isLoading = true;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 3500)).then((_) => setState(() {
          _isLoading = false;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen.navigate(
      name: 'assets/Loadinggg.flr',
      next: (context) => Landing(),
      startAnimation: 'loading',
      isLoading: _isLoading,
      backgroundColor: Colors.white,
    );
  }
}

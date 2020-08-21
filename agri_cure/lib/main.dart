import 'package:agri_cure/providers/pageVIewProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'services/routing.dart';
import 'screens/Landing.dart';
import 'splashscreen.dart';

void main() {
  FluroRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<PageViewProvider>(create: (_) => PageViewProvider()),
      ],
      child: MaterialApp(
        title: 'AgriCure',
        onGenerateRoute: FluroRouter.router.generator,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: SplashScreens(),
      ),
    );
  }
}

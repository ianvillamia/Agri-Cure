import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  Landing({Key key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * .1,
            ),
            Bounce(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/icon1.png'))),
              ),
            ),
            SlideInLeft(
              child: Text(
                'AGRICURE',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * .2,
            ),
            MaterialButton(
              height: size.height * .08,
              minWidth: size.width * .5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.green)),
              onPressed: () {
                //material to next screen
                Navigator.pushNamed(context, '/onboardingMain');
              },
              child: Text('GET STARTED'),
            )
          ],
        ),
      ),
    ));
  }
}

import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * .1,
            ),
            Opacity(
              opacity: .6,
              child: Container(
                width: size.width * .8,
                height: size.height * .3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/login-pic.png'))),
              ),
            ),
            Container(
              width: size.width * .8,
              height: size.height * .5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: CustomTextStyles.boldText(size: 40),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

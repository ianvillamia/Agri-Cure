import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
              height: size.height * .2,
            ),
            BounceInUp(
              child: Image.asset('assets/icon1.png'),
            ),
            SizedBox(
              height: size.height * .15,
            ),
            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    height: size.height * .08,
                    minWidth: size.width * .35,
                    color: Color.fromRGBO(20, 170, 105, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {
                      //material to next screen
                      Navigator.pushNamed(context, '/loginScreen');
                    },
                    child: Text(
                      'Login',
                      style: CustomTextStyles.whiteText(),
                    ),
                  ),
                  MaterialButton(
                    height: size.height * .08,
                    minWidth: size.width * .35,
                    color: Color.fromRGBO(255, 201, 0, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signupScreen');
                    },
                    child: Text(
                      'Sign-Up',
                      style: CustomTextStyles.whiteText(),
                    ),
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

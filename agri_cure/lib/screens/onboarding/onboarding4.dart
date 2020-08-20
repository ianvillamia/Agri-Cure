import 'package:agri_cure/screens/onboarding/circles.dart';
import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:agri_cure/widgets/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:agri_cure/providers/pageVIewProvider.dart';
import 'package:provider/provider.dart';

class Onboarding4 extends StatefulWidget {
  Onboarding4({Key key}) : super(key: key);

  @override
  _Onboarding4State createState() => _Onboarding4State();
}

class _Onboarding4State extends State<Onboarding4> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'authScreen');
        },
        child: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: size.height * .2,
                ),
                Container(
                  width: size.width * .7,
                  height: size.height * .2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                Text(
                  'TITLE',
                  style: CustomTextStyles.boldText(),
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                Container(
                  width: size.width * .8,
                  height: size.height * .2,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                    style: CustomTextStyles.boldText(),
                  ),
                ),
                SizedBox(
                  height: size.height * .08,
                ),
                Container(
                    width: size.width * .8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CustomWidgets.circle(color: Colors.grey, size: size),
                        CustomWidgets.circle(color: Colors.grey, size: size),
                        CustomWidgets.circle(color: Colors.grey, size: size),
                        CustomWidgets.circle(color: Colors.green, size: size),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:agri_cure/widgets/customWidgets.dart';
import 'package:flutter/material.dart';

class Onboarding2 extends StatefulWidget {
  Onboarding2({Key key}) : super(key: key);

  @override
  _Onboarding2State createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
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
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                style: CustomTextStyles.boldText(),
              ),
            ),
            SizedBox(
              height: size.height * .05,
            ),
          ],
        ),
      ),
    );
  }
}

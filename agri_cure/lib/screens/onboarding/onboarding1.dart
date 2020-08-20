import 'package:agri_cure/providers/pageVIewProvider.dart';
import 'package:agri_cure/screens/onboarding/circles.dart';
import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:agri_cure/widgets/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Onboarding1 extends StatefulWidget {
  Onboarding1({Key key}) : super(key: key);

  @override
  _Onboarding1State createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final pageViewProvider =
        Provider.of<PageViewProvider>(context, listen: false);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          pageViewProvider.nextPage();
        },
        child: Container(
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
              Circles()
            ],
          ),
        ),
      ),
    );
  }
}

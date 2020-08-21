import 'package:agri_cure/screens/onboarding/circles.dart';
import 'package:agri_cure/services/routes.dart';
import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:agri_cure/widgets/customWidgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:agri_cure/providers/pageVIewProvider.dart';
import 'package:provider/provider.dart';

class Onboarding3 extends StatefulWidget {
  Onboarding3({Key key}) : super(key: key);

  @override
  _Onboarding3State createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final pageViewProvider =
        Provider.of<PageViewProvider>(context, listen: false);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.homeScreen);
        },
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height * .4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/onboard-3.png'),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                top: 250,
                child: Container(
                  width: size.width,
                  height: size.height * .8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: SingleChildScrollView(
                      child: FadeInDown(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Mission',
                              style: CustomTextStyles.boldText(size: 25),
                            ),
                            SizedBox(
                              height: size.height * .01,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Upang matupad ang aming layunin, ang AgriCure ay sisiguraduhing mananatili ang sistematiko, ligtas, tapat at magpakakatiwalaang paglilingkod sa aming mga kasapi. Maglalaan ng mga napapanahong ulat tungkol sa kalagayang agrikultural at sisiguraduhing wala ng maluluging magsasaka. ',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: size.height * .05,
                            ),
                            Container(
                                width: size.width * .8,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    CustomWidgets.circle(
                                        color: Colors.grey, size: size),
                                    CustomWidgets.circle(
                                        color: Colors.grey, size: size),
                                    CustomWidgets.circle(
                                        color: Colors.green, size: size),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:agri_cure/providers/pageVIewProvider.dart';
import 'package:agri_cure/screens/onboarding/circles.dart';
import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:agri_cure/widgets/customWidgets.dart';
import 'package:animate_do/animate_do.dart';
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
          child: Stack(
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height * .4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/onboard-1.png'),
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
                    child: FadeInDown(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Ano ang AgriCure?',
                            style: CustomTextStyles.boldText(size: 25),
                          ),
                          SizedBox(
                            height: size.height * .06,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Ang AgriCure ay isang aplikasyon na naglalayong gawing sentralisado ang proseso ng pagbebenta ng inyong mga produkto. Sa tulong nito, mas maraming pang- agrikultural na kabuhayan ang magkakaroon ng maayos na kita.',
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
                                      color: Colors.green, size: size),
                                  CustomWidgets.circle(
                                      color: Colors.grey, size: size),
                                  CustomWidgets.circle(
                                      color: Colors.grey, size: size),
                                ],
                              ))
                        ],
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

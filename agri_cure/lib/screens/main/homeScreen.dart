import 'package:agri_cure/services/routes.dart';
import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: SlideInLeft(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      height: size.height * .15,
                      width: size.width * .2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/icon1.png'))),
                    ),
                    Text(
                      'AGRICURE',
                      style: CustomTextStyles.boldText(size: 30),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                Wrap(
                  children: <Widget>[
                    _buttonBuilder(
                        size: size,
                        icon: 'assets/home-icon1.png',
                        ontap: () {
                          Navigator.pushNamed(context, Routes.registerFarmer);
                        },
                        buttonText: 'Mag Rehistro ng magsasaka'),
                    SizedBox(
                      height: size.height * .05,
                    ),
                    _buttonBuilder(
                        size: size,
                        icon: 'assets/home-icon2.png',
                        ontap: () {
                          Navigator.pushNamed(context, Routes.cropPickup);
                        },
                        buttonText: 'Schedule Crop-Pickup'),
                    SizedBox(
                      height: size.height * .05,
                    ),
                    _buttonBuilder(
                        size: size,
                        icon: 'assets/home-icon3.png',
                        ontap: () {
                          Navigator.pushNamed(
                              context, Routes.transactionScreen);
                        },
                        buttonText: 'Talaan ng mga Transaksyon'),
                    SizedBox(
                      height: size.height * .05,
                    ),
                    _buttonBuilder(
                        size: size,
                        icon: 'assets/home-icon4.png',
                        ontap: () {
                          Navigator.pushNamed(context, Routes.cropInventory);
                        },
                        buttonText: 'Talaan ng mga Produkto'),
                    SizedBox(
                      height: size.height * .05,
                    ),
                  ],
                ),
                Center(
                  child: _buttonBuilder(
                      size: size,
                      icon: 'assets/home-icon5.png',
                      ontap: () {
                        Navigator.pushNamed(context, Routes.membersScreen);
                      },
                      buttonText: 'Mga Miyembro ng magsasaka'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buttonBuilder(
      {@required size,
      @required String icon,
      @required ontap,
      @required String buttonText}) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          Container(
              width: size.width * .4,
              height: size.height * .30,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(20, 170, 105, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: Material(
                color: Colors.transparent,
                child: new InkWell(
                  onTap: ontap,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(9),
                          width: 150,
                          child: Text(
                            buttonText,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.whiteText(),
                          ),
                        ),
                      ]),
                ),
              )),
          Positioned(
            left: 5,
            top: 5,
            child: Container(
              height: size.height * .22,
              width: size.width * .37,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 222, 98, 1),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      topLeft: Radius.circular(18)),
                  image: DecorationImage(image: AssetImage(icon))),
            ),
          ),
        ],
      ),
    );

    // return Container(
    //   color: Colors.blue,
    //   height: size.height * .17,
    //   child: Stack(
    //     children: <Widget>[
    //       Center(
    //         child: Container(
    //             width: size.width * .7,
    //             height: size.height * .17,
    //             decoration: BoxDecoration(
    //                 color: Color.fromRGBO(20, 170, 105, 1),
    //                 borderRadius: BorderRadius.circular(20)),
    //             child: Material(
    //               color: Colors.transparent,
    //               child: new InkWell(
    //                 onTap: ontap,
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(left: 70, top: 20),
    //                   child: Container(
    //                     width: 150,
    //                     child: Text(
    //                       buttonText,
    //                       style: CustomTextStyles.whiteText(),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             )),
    //       ),
    //       Positioned(
    //         left: 10,
    //         top: -10,
    //         child: Container(
    //           height: size.height * .17,
    //           width: size.width * .3,
    //           decoration: BoxDecoration(
    //               image: DecorationImage(image: AssetImage(icon))),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

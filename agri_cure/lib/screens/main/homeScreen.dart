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
                      height: size.height * .2,
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
                  height: size.height * .05,
                ),
                _buttonBuilder(
                    size: size,
                    icon: 'assets/home-icon1.png',
                    ontap: () {
                      Navigator.pushNamed(context, '/registerFarmer');
                    },
                    buttonText: 'MAG REHISTRO NG MAGSASAKA'),
                SizedBox(
                  height: size.height * .05,
                ),
                _buttonBuilder(
                    size: size,
                    icon: 'assets/home-icon4.png',
                    ontap: () {},
                    buttonText: 'Schedule Crop-Pickup'),
                SizedBox(
                  height: size.height * .05,
                ),
                _buttonBuilder(
                    size: size,
                    icon: 'assets/home-icon2.png',
                    ontap: () {},
                    buttonText: 'TALAAN NG MGA TRANSAKSYON'),
                SizedBox(
                  height: size.height * .05,
                ),
                _buttonBuilder(
                    size: size,
                    icon: 'assets/home-icon3.png',
                    ontap: () {},
                    buttonText: 'TALAAN NG MGA PRODUKTO'),
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
      height: size.height * .17,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
                width: size.width * .7,
                height: size.height * .17,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(20, 170, 105, 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Material(
                  color: Colors.transparent,
                  child: new InkWell(
                    onTap: ontap,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 70, top: 20),
                      child: Container(
                        width: 150,
                        child: Text(
                          buttonText,
                          style: CustomTextStyles.whiteText(),
                        ),
                      ),
                    ),
                  ),
                )),
          ),
          Positioned(
            left: 10,
            top: -10,
            child: Container(
              height: size.height * .2,
              width: size.width * .3,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(icon))),
            ),
          ),
        ],
      ),
    );
  }
}

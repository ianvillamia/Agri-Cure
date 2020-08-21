import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CropPickUpSuccess extends StatefulWidget {
  CropPickUpSuccess({Key key}) : super(key: key);

  @override
  _CropPickUpSuccessState createState() => _CropPickUpSuccessState();
}

class _CropPickUpSuccessState extends State<CropPickUpSuccess> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * .2,
            ),
            ElasticIn(
              child: Container(
                width: size.width * .7,
                height: size.height * .3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/delivery.jpg'))),
              ),
            ),
            Text(
              'Congratulations',
              style: CustomTextStyles.boldText(),
            ),
            SizedBox(
              height: size.height * .1,
            ),
            Text(
              'Crop has been ',
              style: CustomTextStyles.boldText(size: 30),
            ),
            Text(
              'Scheduled for Pickup',
              style: CustomTextStyles.boldText(size: 30),
            ),
            SizedBox(
              height: size.height * .05,
            ),
            MaterialButton(
                height: size.height * .07,
                minWidth: size.width * .3,
                color: Color.fromRGBO(20, 170, 105, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/homeScreen');
                },
                child: Container(
                  width: size.width * .3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Continue',
                        style: CustomTextStyles.whiteText(),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

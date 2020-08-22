import 'package:agri_cure/services/firestore/fireService.dart';
import 'package:agri_cure/services/routes.dart';
import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CropPickUp extends StatefulWidget {
  CropPickUp({Key key}) : super(key: key);

  @override
  _CropInventoryScreenState createState() => _CropInventoryScreenState();
}

class _CropInventoryScreenState extends State<CropPickUp> {
  TextEditingController _name = TextEditingController(),
      _schedule = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: FadeInDown(
              child: Column(
                children: <Widget>[
                  Opacity(
                    opacity: .9,
                    child: Container(
                      width: size.width,
                      height: size.height * .35,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage('assets/crop-pickup.png'),
                              fit: BoxFit.fill)),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 30,
                            child: IconButton(
                              splashColor: Colors.blue,
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 45,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Schedule Crop Pickup',
                          style: CustomTextStyles.boldText(size: 27),
                        ),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        Text(
                          'Pangalan ng Magsasaka',
                          style: CustomTextStyles.boldText(),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Container(
                          width: size.width * .8,
                          child: TextFormField(
                            controller: _name,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            style: TextStyle(
                                fontSize: 30.0,
                                height: 2.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.arrow_drop_down),
                              contentPadding: const EdgeInsets.all(8.0),
                              labelText: 'Pangalan',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: "Juan Dela Cruz",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        Text(
                          'Iskeydul',
                          style: CustomTextStyles.boldText(),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Container(
                          width: size.width * .8,
                          child: TextFormField(
                            controller: _schedule,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            style: TextStyle(
                                fontSize: 30.0,
                                height: 2.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.calendar_today),
                              contentPadding: const EdgeInsets.all(8.0),
                              labelText: 'Iskeydul',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: "Enero",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * .05),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: MaterialButton(
                          height: size.height * .07,
                          minWidth: size.width * .3,
                          color: Color.fromRGBO(255, 201, 0, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              //add tranasction to log
                              var mapData = {
                                'name': _name.text,
                                'schedule': _schedule.text
                              };
                              await FireService()
                                  .addPickUp(map: mapData)
                                  .then((val) {
                                Navigator.pushNamed(
                                    context, Routes.cropPickUpSuccess);
                              });
                            }
                          },
                          child: Container(
                            width: size.width * .35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  'Ipagpatuloy',
                                  style: CustomTextStyles.whiteText(),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                  SizedBox(height: size.height * .05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

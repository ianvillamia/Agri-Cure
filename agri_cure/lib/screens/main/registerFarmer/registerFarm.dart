import 'package:agri_cure/services/routes.dart';
import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';

class RegisterFarmScreen extends StatefulWidget {
  RegisterFarmScreen({Key key}) : super(key: key);

  @override
  _RegisterFarmScreenState createState() => _RegisterFarmScreenState();
}

class _RegisterFarmScreenState extends State<RegisterFarmScreen> {
  TextEditingController landSize = TextEditingController(),
      address = TextEditingController(),
      lotOwnerShipStatus = TextEditingController(),
      supportingDocument = TextEditingController(),
      monthOfYield = TextEditingController(),
      numberOfYield = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
                            image: AssetImage('assets/register-farm.png'),
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
                  padding: EdgeInsets.only(left: size.width * .1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Mag Rehistro',
                        style: CustomTextStyles.boldText(size: 30),
                      ),
                      Text(
                        'Impormasyon ng Lupa',
                        style: CustomTextStyles.coloredText(
                            color: Colors.grey, size: 20),
                      ),
                      SizedBox(
                        height: size.height * .05,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: size.width * .4,
                            child: TextField(
                              controller: landSize,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(8.0),
                                labelText: 'Sukat ng Lupa',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: "100 sqm",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * .02,
                          ),
                          Container(
                            width: size.width * .4,
                            child: TextField(
                              controller: address,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(8.0),
                                labelText: 'Lokasyon',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: "Dela Cruz",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      _buildForm(
                          controller: lotOwnerShipStatus,
                          label: 'Lot Ownership Status',
                          size: size,
                          hint: 'owned,etc,etc'),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      _buildForm(
                          controller: supportingDocument,
                          label: 'Supporting Document',
                          size: size,
                          hint: 'document'),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      _buildForm(
                          controller: monthOfYield,
                          label: 'Buwan ng anihan',
                          size: size,
                          hint: 'owned,etc,etc'),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Container(
                        width: size.width * .8,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: numberOfYield,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.arrow_drop_down),
                            contentPadding: const EdgeInsets.all(8.0),
                            labelText: 'Bilang ng ani sa isang taon',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "January December",
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
                          var farm = {
                            'landSize': landSize.text,
                            'address': address,
                            'lotOwnerShipStatus': lotOwnerShipStatus.text,
                            'supportingDocument': supportingDocument.text,
                            'buwanNgAanihan': monthOfYield,
                            'yieldPerYear': numberOfYield
                          };
                        },
                        child: Container(
                          width: size.width * .3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'Register',
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
    );
  }

  _buildForm(
      {@required label,
      @required size,
      @required hint,
      bool ispass,
      @required controller}) {
    return Container(
      width: size.width * .8,
      child: TextField(
        controller: controller,
        obscureText: ispass ?? false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8.0),
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: hint,
        ),
      ),
    );
  }
}

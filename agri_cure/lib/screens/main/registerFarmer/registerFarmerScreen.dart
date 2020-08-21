import 'package:agri_cure/models/farmers.dart';
import 'package:agri_cure/services/firestore/fireService.dart';
import 'package:agri_cure/services/routes.dart';
import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class RegisterFarmerScreen extends StatefulWidget {
  RegisterFarmerScreen({Key key}) : super(key: key);

  @override
  _RegisterFarmerScreenState createState() => _RegisterFarmerScreenState();
}

class _RegisterFarmerScreenState extends State<RegisterFarmerScreen> {
  String gender = 'Male';
  TextEditingController _firstNameController = TextEditingController(),
      _lastNameController = TextEditingController(),
      _addressController = TextEditingController(),
      _birthDayController = TextEditingController(),
      _birthAddressController = TextEditingController(),
      _civilStatusController = TextEditingController(),
      _contactNumberController = TextEditingController(),
      _governmentIdController = TextEditingController();
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
                            image: AssetImage('assets/register-farmer.png'),
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
                        'Personal na Impormasyon',
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
                              controller: _firstNameController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(8.0),
                                labelText: 'Pangalan',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: "Juan",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * .02,
                          ),
                          Container(
                            width: size.width * .4,
                            child: TextField(
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(8.0),
                                labelText: 'Apelyido',
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
                          controller: _addressController,
                          label: 'Tirahan',
                          size: size,
                          hint: '1234 Cabanatuan'),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: size.width * .4,
                            child: TextField(
                              controller: _birthDayController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.calendar_today),
                                ),
                                contentPadding: const EdgeInsets.all(8.0),
                                labelText: 'Kaarawan',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: "Oktubre 19",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * .02,
                          ),
                          Container(
                              width: size.width * .38,
                              height: size.height * .07,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.grey)),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: DropdownButton<String>(
                                  value: gender,
                                  icon: Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: Colors.deepPurple),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      gender = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Male',
                                    'Female',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      _buildForm(
                          controller: _birthAddressController,
                          label: 'Lugar sa Kapanganakan',
                          size: size,
                          hint: '1236 Camp Tinio Cabanatuan City'),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: size.width * .4,
                            child: TextField(
                              controller: _civilStatusController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_drop_down),
                                ),
                                contentPadding: const EdgeInsets.all(8.0),
                                labelText: 'Katayuang Sibil',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: "katayuang sibil",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * .02,
                          ),
                          Container(
                            width: size.width * .4,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _contactNumberController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.network_cell),
                                ),
                                contentPadding: const EdgeInsets.all(8.0),
                                labelText: 'Contact no',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: "0992-206-2222",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Container(
                        width: size.width * .8,
                        child: TextField(
                          controller: _governmentIdController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.attach_file),
                            ),
                            contentPadding: const EdgeInsets.all(8.0),
                            labelText: 'Valid Gov. Id',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "A61798888",
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
                          String firstName = _firstNameController.text;
                          String lastName = _lastNameController.text;
                          String address = _addressController.text;
                          String birthDate = _birthDayController.text;

                          String civilStatus = _civilStatusController.text;
                          String contactNumber = _contactNumberController.text;
                          String governmentId = _governmentIdController.text;
                          var farmer = {
                            'firstName': firstName,
                            'lastName': lastName,
                            'address': address,
                            'birthDate': birthDate,
                            'gender': gender,
                            'civilStatus': civilStatus,
                            'contactNumber': contactNumber,
                            'governmentId': governmentId
                          };
                          await FireService()
                              .addProductPurchaseRequest(map: farmer)
                              .then((val) {
                            Navigator.pushNamed(context, Routes.registerFarm);
                          });
                          // Navigator.pushNamed(context, Routes.registerFarm);
                        },
                        child: Container(
                          width: size.width * .3,
                          child: Row(
                            children: <Widget>[
                              Text(
                                'SUSUNOD',
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

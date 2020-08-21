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
                            width: size.width * .4,
                            child: TextField(
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_drop_down),
                                ),
                                contentPadding: const EdgeInsets.all(8.0),
                                labelText: 'Kasarian',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: "Lalake",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      _buildForm(
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
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_drop_down),
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
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.registerFarm);
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

  _buildForm({@required label, @required size, @required hint, bool ispass}) {
    return Container(
      width: size.width * .8,
      child: TextField(
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

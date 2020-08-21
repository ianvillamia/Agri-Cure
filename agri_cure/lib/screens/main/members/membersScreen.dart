import 'package:agri_cure/services/routes.dart';
import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class MembersScreen extends StatefulWidget {
  MembersScreen({Key key}) : super(key: key);

  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Opacity(
                  opacity: .9,
                  child: Container(
                    width: size.width,
                    height: size.height * .3,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: AssetImage('assets/farmers.jpg'),
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
                //add thing here
                Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Mga Miyembro',
                              style: CustomTextStyles.boldText(),
                            ),
                            Container(
                              width: size.width * .4,
                              child: TextField(
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.search),
                                  contentPadding: const EdgeInsets.all(8.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  hintText: "Search",
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        _buildCard(
                            context: context,
                            size: size,
                            image: 'assets/female.png',
                            name: 'BALLESTRA, SHEROLD C',
                            address: 'SAPPAAC BANGUED ABRA'),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        _buildCard(
                            context: context,
                            size: size,
                            image: 'assets/male.png',
                            name: 'BALLESTRA, SHEROLD C',
                            address: 'SAPPAAC BANGUED ABRA'),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        _buildCard(
                            context: context,
                            size: size,
                            image: 'assets/male.png',
                            name: 'BALLESTRA, SHEROLD C',
                            address: 'SAPPAAC BANGUED ABRA'),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildCard(
      {@required BuildContext context,
      @required size,
      @required String image,
      @required name,
      @required address}) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          //call dialog here
          showAlertDialog(
              context: context,
              size: size,
              name: name,
              address: address,
              image: image);
        },
        splashColor: Colors.blue,
        child: Container(
          width: size.width * .8,
          height: size.height * .15,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Container(
                  width: size.width * .2,
                  height: size.height * .2,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(image))),
                ),
                SizedBox(
                  width: size.width * .05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Text(name),
                    Expanded(child: Text(address))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(
      {@required BuildContext context,
      @required size,
      @required name,
      @required image,
      @required address}) {
    Size insize = size;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: Container(
            width: insize.width * .4,
            height: insize.height * .6,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: insize.width * .2,
                    height: insize.height * .2,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(image))),
                  ),
                  Text("Name: \n" + name),
                  Text('Address: \n' + address),
                  Text('Date Registered:\n January 1,2020')
                ],
              ),
            ),
          ),
        );
        ;
      },
    );
  }
}

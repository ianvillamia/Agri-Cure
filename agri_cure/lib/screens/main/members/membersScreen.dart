import 'package:agri_cure/models/farmers.dart';
import 'package:agri_cure/services/routes.dart';
import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                        StreamBuilder<QuerySnapshot>(
                            stream: Firestore.instance
                                .collection('farmers')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                    children: snapshot.data.documents
                                        .map((doc) => _buildCard(
                                            context: context,
                                            size: size,
                                            doc: doc))
                                        .toList());
                              }
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            })
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      {@required BuildContext context,
      @required size,
      @required DocumentSnapshot doc}) {
    Farmer farmer = Farmer().getNewFarmer(doc: doc);
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          //call dialog here
          showAlertDialog(context: context, size: size, farmer: farmer);
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
                      image: DecorationImage(
                          image: AssetImage('assets/male.png'))),
                ),
                SizedBox(
                  width: size.width * .05,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Text(farmer.firstName + " " + farmer.lastName),
                      Expanded(child: Text(farmer.address))
                    ],
                  ),
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
      @required Farmer farmer}) {
    Size insize = size;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: Container(
            width: insize.width * .4,
            height: insize.height * .8,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: insize.width * .2,
                    height: insize.height * .2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/male.png'))),
                  ),
                  Text("Name: \n" + farmer.firstName + " " + farmer.lastName),
                  Text('Address: \n' + farmer.address),
                  Text('Date Registered:\n' + farmer.dateRegistered),
                  Text('Civil Status:\n' + farmer.civilStatus),
                  Text('BirthDate :\n' + farmer.birthDate),
                  Text('GovernmentId :\n' + farmer.governmentId),
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

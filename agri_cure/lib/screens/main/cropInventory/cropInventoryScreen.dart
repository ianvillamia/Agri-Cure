import 'package:agri_cure/models/cropInventoryModel.dart';
import 'package:agri_cure/services/firestore/fireService.dart';
import 'package:agri_cure/services/routes.dart';
import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CropInventory extends StatefulWidget {
  CropInventory({Key key}) : super(key: key);

  @override
  _CropInventoryState createState() => _CropInventoryState();
}

class _CropInventoryState extends State<CropInventory> {
  String selected = 'For-Sale';
  String param = 'forSale';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //navigator push here
          Navigator.pushNamed(context, Routes.addCrop);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: size.width,
        height: size.height,
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
                          image: AssetImage('assets/inventory.png'),
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
                            'Crop Inventory \n $selected',
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
                      Container(
                        width: size.width,
                        height: size.height * .1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _roundedButton(
                                onTap: () {
                                  setState(() {
                                    selected = 'ForSale';
                                    param = 'forSale';
                                  });
                                },
                                size: size,
                                color: Colors.greenAccent,
                                buttonText: 'For-Sale'),
                            _roundedButton(
                                onTap: () {
                                  setState(() {
                                    selected = 'Pending';
                                    param = 'pending';
                                  });
                                },
                                size: size,
                                color: Colors.yellow,
                                buttonText: 'Pending'),
                            _roundedButton(
                                onTap: () {
                                  setState(() {
                                    selected = 'Bought';
                                    param = 'bought';
                                  });
                                },
                                size: size,
                                color: Colors.red,
                                buttonText: 'Bought'),
                          ],
                        ),
                      ),
                      Container(
                        height: size.height * .34,
                        child: SingleChildScrollView(
                            child: StreamBuilder<QuerySnapshot>(
                                stream: Firestore.instance
                                    .collection('cropInventory')
                                    .where('cropState', isEqualTo: param)
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasData) {
                                    return Column(
                                        children: snapshot.data.documents
                                            .map((doc) => _buildCard(
                                                doc: doc,
                                                context: context,
                                                size: size))
                                            .toList());
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                })),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    @required DocumentSnapshot doc,
    @required BuildContext context,
    @required size,
  }) {
    CropInventoryModel cropInventory =
        CropInventoryModel().getNewCropInventory(doc: doc);
    return Card(
        elevation: 5,
        child: InkWell(
          onTap: () {
            //call dialog here
            showAlertDialog(
                context: context, size: size, cropInventory: cropInventory);
          },
          splashColor: Colors.blue,
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: size.width * .05,
                    ),
                    Flexible(
                        child: Text(cropInventory.productType +
                            ' | ' +
                            cropInventory.cropState.toUpperCase() +
                            ' | ' +
                            cropInventory.owner +
                            ' | ' +
                            cropInventory.description)),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  showAlertDialog(
      {@required BuildContext context,
      @required size,
      @required CropInventoryModel cropInventory}) {
    Size insize = size;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: Container(
            width: insize.width * .4,
            height: insize.height * .4,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Change Product State',
                    style: CustomTextStyles.boldText(),
                  ),
                  _roundedButton(
                      onTap: () async {
                        await FireService()
                            .changeInventoryToForSale(crop: cropInventory)
                            .then((val) {
                          Navigator.pop(context);
                        });
                      },
                      size: size,
                      color: Colors.greenAccent,
                      buttonText: 'For-Sale'),
                  _roundedButton(
                      onTap: () async {
                        await FireService()
                            .changeInventoryToPending(crop: cropInventory)
                            .then((val) {
                          Navigator.pop(context);
                        });
                      },
                      size: size,
                      color: Colors.yellow,
                      buttonText: 'Pending'),
                  _roundedButton(
                      onTap: () async {
                        await FireService()
                            .changeInventoryToForBought(crop: cropInventory)
                            .then((val) {
                          Navigator.pop(context);
                        });
                      },
                      size: size,
                      color: Colors.redAccent,
                      buttonText: 'Bought'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _roundedButton(
      {@required size,
      @required Color color,
      @required buttonText,
      @required onTap}) {
    return MaterialButton(
        height: size.height * .03,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: onTap,
        child: Container(
          width: size.width * .19,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                buttonText,
                style: CustomTextStyles.whiteText(),
              ),
            ],
          ),
        ));
  }
}

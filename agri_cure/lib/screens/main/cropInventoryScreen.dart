import 'package:flutter/material.dart';

class CropInventoryScreen extends StatefulWidget {
  CropInventoryScreen({Key key}) : super(key: key);

  @override
  _CropInventoryScreenState createState() => _CropInventoryScreenState();
}

class _CropInventoryScreenState extends State<CropInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: <Widget>[
            //enter widgets here
          ],
        ),
      ),
    );
  }
}

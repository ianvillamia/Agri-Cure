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
        child: Column(
          children: <Widget>[
            //enter widgets here
          ],
        ),
      ),
    );
  }
}

import 'package:agri_cure/providers/pageVIewProvider.dart';
import 'package:agri_cure/widgets/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Circles extends StatefulWidget {
  final page;
  Circles({@required this.page});

  @override
  _CirclesState createState() => _CirclesState();
}

class _CirclesState extends State<Circles> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
        width: size.width * .8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomWidgets.circle(color: Colors.green, size: size),
            CustomWidgets.circle(color: Colors.grey, size: size),
            CustomWidgets.circle(color: Colors.grey, size: size),
            CustomWidgets.circle(color: Colors.grey, size: size),
          ],
        ));
  }

  _buildCircles({@required double page, @required size}) {
    if (page == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomWidgets.circle(color: Colors.green, size: size),
          CustomWidgets.circle(color: Colors.grey, size: size),
          CustomWidgets.circle(color: Colors.grey, size: size),
          CustomWidgets.circle(color: Colors.grey, size: size),
        ],
      );
    }
    if (page == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomWidgets.circle(color: Colors.grey, size: size),
          CustomWidgets.circle(color: Colors.green, size: size),
          CustomWidgets.circle(color: Colors.grey, size: size),
          CustomWidgets.circle(color: Colors.grey, size: size),
        ],
      );
    }
  }
}

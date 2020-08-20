import 'package:agri_cure/widgets/customWidgets.dart';
import 'package:flutter/material.dart';

class Circles extends StatefulWidget {
  Circles({Key key}) : super(key: key);

  @override
  _CirclesState createState() => _CirclesState();
}

class _CirclesState extends State<Circles> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width * .8, child: _buildCircles(page: 1, size: size));
  }

  _buildCircles({@required int page, @required size}) {
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
  }
}

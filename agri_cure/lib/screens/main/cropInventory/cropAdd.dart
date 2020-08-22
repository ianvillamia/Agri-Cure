import 'package:agri_cure/services/firestore/fireService.dart';
import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:flutter/material.dart';

class CropAdd extends StatefulWidget {
  CropAdd({Key key}) : super(key: key);

  @override
  _CropAddState createState() => _CropAddState();
}

class _CropAddState extends State<CropAdd> {
  TextEditingController _productType = TextEditingController(),
      _owner = TextEditingController(),
      _description = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              children: <Widget>[
                //enter widgets here
                Container(
                  width: size.width,
                  height: size.height * .3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/farm.jpg'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: size.height * .05,
                        child: IconButton(
                            splashColor: Colors.blue,
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      )
                    ],
                  ),
                ),

                Container(
                  height: size.height * .7,
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'ADD CROP',
                            style: CustomTextStyles.boldText(),
                          ),
                          _buildTextFormField(
                              labelText: 'Product Type',
                              controller: _productType),
                          _buildTextFormField(
                              labelText: 'Owner', controller: _owner),
                          _buildTextFormField(
                              labelText: 'Description',
                              controller: _description),
                          Align(
                            alignment: Alignment.centerRight,
                            child: MaterialButton(
                                height: size.height * .05,
                                color: Colors.greenAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    var mapData = {
                                      'productType': _productType.text,
                                      'owner': _owner.text,
                                      'description': _description.text,
                                      'cropState': 'forSale',
                                      'ref': ''
                                    };
                                    await FireService()
                                        .addCropInventory(map: mapData)
                                        .then((onValue) {
                                      Navigator.pop(context);
                                    });
                                  }
                                },
                                child: Container(
                                  width: size.width * .19,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        'Continue',
                                        style: CustomTextStyles.whiteText(),
                                      ),
                                    ],
                                  ),
                                )),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildTextFormField({@required labelText, @required controller}) {
    return TextFormField(
      controller: controller,
      validator: (val) {
        if (val.isEmpty) {
          return 'Must not be Empty';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

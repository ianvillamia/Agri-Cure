import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatefulWidget {
  TransactionsScreen({Key key}) : super(key: key);

  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
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
                            image: AssetImage('assets/transactions.png'),
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
                              'Mga Transaksyon',
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
                            icon: Icons.train,
                            context: context,
                            size: size,
                            transactionId: '112344',
                            transactionDate: 'Oktubre 11,2019',
                            transactionType: 'Crop-Delivery',
                            transactionDetails:
                                'He delivered the crop at the desired adress at Oktubre 11,2019 he notified the Association Admin immediately after this'),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        _buildCard(
                            icon: Icons.get_app,
                            context: context,
                            size: size,
                            transactionId: '323222',
                            transactionDate: 'Enero 10,2020',
                            transactionType: 'Crop-Sold',
                            transactionDetails:
                                'Nabenta ko ang paninda sa Sampalok manila..Paki notify ang mga magsasaka ng Bulacan'),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        _buildCard(
                            icon: Icons.supervised_user_circle,
                            context: context,
                            size: size,
                            transactionId: '23244',
                            transactionDate: 'Marso 10,2020',
                            transactionType: 'Farmer-Register',
                            transactionDetails:
                                'Farmer John register to Association'),
                        _buildCard(
                            icon: Icons.train,
                            context: context,
                            size: size,
                            transactionId: '112344',
                            transactionDate: 'Oktubre 11,2019',
                            transactionType: 'Crop-Delivery',
                            transactionDetails:
                                'He delivered the crop at the desired adress at Oktubre 11,2019 he notified the Association Admin immediately after this'),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        _buildCard(
                            icon: Icons.get_app,
                            context: context,
                            size: size,
                            transactionId: '323222',
                            transactionDate: 'Enero 10,2020',
                            transactionType: 'Crop-Sold',
                            transactionDetails:
                                'Nabenta ko ang paninda sa Sampalok manila..Paki notify ang mga magsasaka ng Bulacan'),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        _buildCard(
                            icon: Icons.supervised_user_circle,
                            context: context,
                            size: size,
                            transactionId: '23244',
                            transactionDate: 'Marso 10,2020',
                            transactionType: 'Farmer-Register',
                            transactionDetails:
                                'Farmer John register to Association'),
                        _buildCard(
                            icon: Icons.train,
                            context: context,
                            size: size,
                            transactionId: '112344',
                            transactionDate: 'Oktubre 11,2019',
                            transactionType: 'Crop-Delivery',
                            transactionDetails:
                                'He delivered the crop at the desired adress at Oktubre 11,2019 he notified the Association Admin immediately after this'),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        _buildCard(
                            icon: Icons.get_app,
                            context: context,
                            size: size,
                            transactionId: '323222',
                            transactionDate: 'Enero 10,2020',
                            transactionType: 'Crop-Sold',
                            transactionDetails:
                                'Nabenta ko ang paninda sa Sampalok manila..Paki notify ang mga magsasaka ng Bulacan'),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        _buildCard(
                            icon: Icons.supervised_user_circle,
                            context: context,
                            size: size,
                            transactionId: '23244',
                            transactionDate: 'Marso 10,2020',
                            transactionType: 'Farmer-Register',
                            transactionDetails:
                                'Farmer John register to Association'),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildCard({
    @required IconData icon,
    @required BuildContext context,
    @required size,
    @required transactionType,
    @required transactionId,
    @required transactionDate,
    @required transactionDetails,
  }) {
    return Card(
        elevation: 5,
        child: InkWell(
          onTap: () {
            //call dialog here
            showAlertDialog(
                context: context,
                size: size,
                transactionType: transactionType,
                transactionDate: transactionDate,
                transactionDetails: transactionDetails,
                transactionId: transactionId);
          },
          splashColor: Colors.blue,
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Row(
                  children: <Widget>[
                    Icon(
                      icon,
                      size: 25,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: size.width * .05,
                    ),
                    Flexible(
                        child: Text(transactionId +
                            ' | ' +
                            transactionType +
                            ' | ' +
                            transactionDate)),
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
      @required transactionId,
      @required transactionType,
      @required transactionDate,
      @required transactionDetails}) {
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
                  Text("TransactionID: \n" + transactionId),
                  SizedBox(
                    height: insize.height * .02,
                  ),
                  Text('TransactionType: \n' + transactionType),
                  SizedBox(
                    height: insize.height * .02,
                  ),
                  Text('Date:\n' + transactionDate),
                  SizedBox(
                    height: insize.height * .02,
                  ),
                  Text('Transaction Details \n' + transactionDetails)
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

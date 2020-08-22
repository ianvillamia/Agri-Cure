import 'package:agri_cure/models/transactions.dart';
import 'package:agri_cure/widgets/customTextStyles.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                        StreamBuilder<QuerySnapshot>(
                            stream: Firestore.instance
                                .collection('transactions')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                    children: snapshot.data.documents
                                        .map((doc) => buildCard(
                                            doc: doc,
                                            size: size,
                                            context: context))
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

  Widget buildCard({
    @required size,
    @required DocumentSnapshot doc,
    @required BuildContext context,
  }) {
    var iconData = Icons.account_circle;
    CustomTransaction transaction =
        CustomTransaction().getNewTransaction(doc: doc);
    switch (transaction.transcationType) {
      case 'FarmerRegistered':
        iconData = Icons.account_circle;
        break;
      case 'ScheduledForPickUp':
        iconData = Icons.train;
        break;
      default:
        iconData = Icons.accessibility;
    }

    return Card(
        elevation: 5,
        child: InkWell(
          onTap: () {
            //call dialog here
            // showAlertDialog(
            //     context: context,
            //     size: size,
            //     transactionType: transactionType,
            //     transactionDate: transactionDate,
            //     transactionDetails: transactionDetails,
            //     transactionId: transactionId);
          },
          splashColor: Colors.blue,
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Row(
                  children: <Widget>[
                    Icon(
                      iconData,
                      size: 25,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: size.width * .05,
                    ),
                    Flexible(
                        child: Text(transaction.transactionId.toString() +
                            ' | ' +
                            transaction.transcationType.toString() +
                            ' | ' +
                            transaction.transactionDate.toString())),
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

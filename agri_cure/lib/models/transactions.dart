import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CustomTransaction {
  int transactionId;
  String transcationType;
  String transactionDate;
  getNewTransaction({@required DocumentSnapshot doc}) {
    var transaction = new CustomTransaction();
    transaction.transactionId = doc.data['id'];
    transaction.transcationType = doc.data['transactionType'];
    transaction.transactionDate = doc.data['date'];
    return transaction;
  }
}

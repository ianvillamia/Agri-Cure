import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Farmer {
  String firstName;
  String lastName;
  String address;
  String birthDate;
  String gender;
  String civilStatus;
  String contactNumber;
  String governmentId;
  String dateRegistered;
  getNewFarmer({@required DocumentSnapshot doc}) {
    var farmer = new Farmer();
    farmer.firstName = doc.data['firstName'];
    farmer.lastName = doc.data['lastName'];
    farmer.address = doc.data['address'];
    farmer.birthDate = doc.data['birthDate'];
    farmer.gender = doc.data['gender'];
    farmer.civilStatus = doc.data['civilStatus'];
    farmer.contactNumber = doc.data['contactNumber'];
    farmer.governmentId = doc.data['governmentId'];
    farmer.dateRegistered = doc.data['dateRegistered'] ?? 'January 1,2019';
    return farmer;
  }
}

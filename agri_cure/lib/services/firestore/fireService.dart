import 'dart:math';

import 'package:agri_cure/models/cropInventoryModel.dart';
import 'package:agri_cure/models/farmers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class FireService {
  final db = Firestore.instance;
  Future addFarmer({Map<String, dynamic> map}) async {
    try {
      await db.collection('farmers').add(map).then((created) async {
        //transaction Log
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
        var mapTransaction = {
          'id': generateRandomString(),
          'date': formattedDate,
          'transactionType': 'FarmerRegistered'
        };
        await db.collection('transactions').add(mapTransaction);
      });
    } catch (e) {
      print(e);
    }
  }

  Future addFarm({Map<String, dynamic> map}) async {
    try {
      await db.collection('farms').add(map).then((created) {
        print('success');
      });
    } catch (e) {
      print(e);
    }
  }

  Future addCropInventory({Map<String, dynamic> map}) async {
    try {
      await db.collection('cropInventory').add(map).then((doc) async {
        await db
            .collection('cropInventory')
            .document(doc.documentID)
            .updateData({'ref': doc.documentID});
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
        var mapTransaction = {
          'id': generateRandomString(),
          'date': formattedDate,
          'transactionType': 'CropAddedToInventory'
        };
        await db.collection('transactions').add(mapTransaction);
      });
    } catch (e) {
      print(e);
    }
  }

  Future changeInventoryToForSale({@required CropInventoryModel crop}) async {
    try {
      await db
          .collection('cropInventory')
          .document(crop.ref)
          .updateData({'cropState': 'forSale'}).then((val) async {
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
        var mapTransaction = {
          'id': generateRandomString(),
          'date': formattedDate,
          'transactionType': 'ChangedCropToForSale'
        };
        await db.collection('transactions').add(mapTransaction);
      });
    } catch (e) {
      print(e);
    }
  }

  Future changeInventoryToForBought({@required CropInventoryModel crop}) async {
    try {
      await db
          .collection('cropInventory')
          .document(crop.ref)
          .updateData({'cropState': 'bought'}).then((val) async {
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
        var mapTransaction = {
          'id': generateRandomString(),
          'date': formattedDate,
          'transactionType': 'ChangedCropToForBought'
        };
        await db.collection('transactions').add(mapTransaction);
      });
    } catch (e) {
      print(e);
    }
  }

  Future changeInventoryToPending({@required CropInventoryModel crop}) async {
    try {
      await db
          .collection('cropInventory')
          .document(crop.ref)
          .updateData({'cropState': 'pending'}).then((val) async {
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
        var mapTransaction = {
          'id': generateRandomString(),
          'date': formattedDate,
          'transactionType': 'ChangedCropToForPending'
        };
        await db.collection('transactions').add(mapTransaction);
      });
    } catch (e) {
      print(e);
    }
  }

  Future addPickUp({Map<String, dynamic> map}) async {
    try {
      await db.collection('forPickUp').add(map).then((created) async {
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
        var mapTransaction = {
          'id': generateRandomString(),
          'date': formattedDate,
          'transactionType': 'ScheduledForPickUp'
        };
        await db.collection('transactions').add(mapTransaction);
      });
    } catch (e) {
      print(e);
    }
  }

  generateRandomString() {
    var rng = new Random();
    return rng.nextInt(10000);
  }
}

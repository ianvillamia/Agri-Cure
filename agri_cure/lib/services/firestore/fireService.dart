import 'package:agri_cure/models/farmers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireService {
  final db = Firestore.instance;
  Future addProductPurchaseRequest({Map<String, dynamic> map}) async {
    try {
      await db.collection('farmers').add(map).then((created) {});
    } catch (e) {
      print(e);
    }
  }
}

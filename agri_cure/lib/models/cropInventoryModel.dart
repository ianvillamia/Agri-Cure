import 'package:cloud_firestore/cloud_firestore.dart';

class CropInventoryModel {
  String cropState;
  String description;
  String owner;
  String productType;
  String ref;

  getNewCropInventory({DocumentSnapshot doc}) {
    var cropInventory = CropInventoryModel();
    cropInventory.cropState = doc.data['cropState'];
    cropInventory.description = doc.data['description'];
    cropInventory.owner = doc.data['owner'];
    cropInventory.productType = doc.data['productType'];
    cropInventory.ref = doc.data['ref'];
    return cropInventory;
  }
}

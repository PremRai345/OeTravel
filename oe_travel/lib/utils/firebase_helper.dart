import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:oe_travel/widgets/general_alert_dialog.dart';

class FireBaseHelper {
  addOrUpdateContent(
    BuildContext context, {
    required String collectionId,
    required String whereId,
    required String whereValue,
    required Map<String, dynamic> map,
  }) async {
    try {
      GeneralAlertDialog().customLoadingDialog(context);
    
      final fireStore = FirebaseFirestore.instance;
      final data = await fireStore
          .collection(collectionId)
          .where(whereId, isEqualTo: whereValue)
          .get();
      if (data.docs.isEmpty) {
        await fireStore.collection(collectionId).add(map);
      } else {
        data.docs.first.reference.update(map);
      }
      Navigator.pop(context);
    } catch (ex) {
      throw ex.toString();
    }
    // print(map);
  }
}

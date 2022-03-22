import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:oe_travel/constant/constants.dart';
import 'package:oe_travel/models/destination_model.dart';

import 'package:oe_travel/utils/firebase_helper.dart';

class DestinationProvider extends ChangeNotifier {
  List<Destination> _listOfDestination = [];

  List<Destination> get listOfDestination => _listOfDestination;

  fetchDestinationData(BuildContext context) async {
    try {
      final data = await FirebaseHelper().getAllData(
        context,
        collectionId: DestinationConstant.destinationCollection,
      );

      if (data.docs.length != _listOfDestination.length) {
        _listOfDestination.clear();

        for (var element in data.docs) {
          _listOfDestination
              .add(Destination.fromJson(element.data(), element.id));
        }
      }
    } catch (ex) {
      print(ex.toString());
    }
  }

  fetchIndiviudalDestinationData({
    required String destinationId,
    required String destinationName,
    required String destinationDescription,
    required String destinationImageUrl,
  }) async {
    try {
      FirebaseHelper().getData(
        collectionId: DestinationConstant.destinationCollection,
        whereId: DestinationConstant.destinationId,
        whereValue: destinationId,
      );
    } catch (ex) {
      print(ex.toString());
    }
  }

  addDestinationData(
    BuildContext context,
    String destinationName,
    String destinationDescription,
    String destinationImageUrl,
  ) async {
    try {
      final destination = Destination(
        destinationName: destinationName,
        destinationDescription: destinationDescription,
        destinationImageUrl: destinationImageUrl,
      );
      final map = destination.toJson();
      log(map.toString());
      await FirebaseHelper().addData(
        context,
        map: map,
        collectionId: DestinationConstant.destinationCollection,
      );
      listOfDestination.add(destination);
      notifyListeners();
    } catch (ex) {
      throw ex.toString();
    }
  }

  updateDestinationData(
    BuildContext context, {
    required String docId,
    required Destination destination,
  }) async {
    await FirebaseHelper().updateData(
      context,
      collectionId: DestinationConstant.destinationCollection,
      docId: docId,
      map: destination.toJson(),
    );
    final oldDestination =
        listOfDestination.firstWhere((element) => element.id! == docId);

    final index = _listOfDestination.indexOf(oldDestination);
    _listOfDestination.removeAt(index);
    _listOfDestination.insert(index, destination);
    notifyListeners();
  }
}

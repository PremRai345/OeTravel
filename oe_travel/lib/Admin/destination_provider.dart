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
        // data.docs.forEach((element) {
        //   _listOfDestination.add(Destination.fromJson(element.data()));
        // });
        for (var element in data.docs) {
          // print(element.data());
          // print(element.id);
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

  addHotelData(
    BuildContext context,
    String destinationName,
    String destinationDescription,
  ) async {
    try {
      // final uuid = Provider.of<UserProvider>(context, listen: false).user.uuid;
      final destination = Destination(
        destinationName: destinationName,
        destinationDescription: destinationDescription,

        // uuid: uuid,
      );
      final map = destination.toJson();
      await FirebaseHelper().addData(
        context,
        map: map,
        collectionId: DestinationConstant.destinationCollection,
      );
      listOfDestination.add(destination);
      notifyListeners();
    } catch (ex) {
      print(ex.toString());
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

import 'package:flutter/cupertino.dart';
import 'package:oe_travel/models/user.dart';

class UserProvider extends ChangeNotifier {
  late User _user;

  setUser(Map obj) {
    _user = User.fromJson(obj);
    notifyListeners();
  }

  User get user => _user;

  Map<String, dynamic> updateUser(
      {required String name, required String address, required int age}) {
    _user = User(
      uuid: _user.uuid,
      email: _user.email,
      name: name,
      address: address,
      age: age,
      image: _user.image,
      photoUrl: null,
    );
    notifyListeners();
    return _user.toJson();
  }

  updateUserImage(String image) {
    _user.image = image;
    notifyListeners();
    // return {
    //   "image": _user.image,
    // };
  }

  addDestinationImage(String image) {
    _user.image = image;
    notifyListeners();
    // return {
    //   "image": _user.image,
    // };
  }
}

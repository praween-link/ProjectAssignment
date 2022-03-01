import 'package:flutter/cupertino.dart';

class InputProvider extends ChangeNotifier {
  String name = '';
  String email = '';
  String password = '';
  String image = '';
  String description = '';
  String price = '';

  void updateName(String n) {
    name = n;
    notifyListeners();
  }

  void updateEmail(String e) {
    name = e;
    notifyListeners();
  }

  void updatePassword(String p) {
    name = p;
    notifyListeners();
  }

  void updateImage(String img) {
    name = img;
    notifyListeners();
  }

  void updateDescription(String d) {
    description = d;
    notifyListeners();
  }
  void updatePrice(String p) {
    price = p;
    notifyListeners();
  }
}

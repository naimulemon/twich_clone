import 'package:flutter/cupertino.dart';
import 'package:twich_clone/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(uid: "", username: "", password: "");

  User get user => _user;

  setUser(User user) {
    _user = user;
    notifyListeners();
  }
}

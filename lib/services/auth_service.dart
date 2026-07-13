import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;

  String get username => "Hugh";

  void login() {
    _loggedIn = true;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    notifyListeners();
  }
}
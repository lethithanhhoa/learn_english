import 'package:flutter/cupertino.dart';
import 'package:learn_english/core/models/user.dart';
import 'package:learn_english/core/services/auth_service.dart';

class AccountUser extends ChangeNotifier {
  AuthService authService = AuthService();
  User user;
  int exp;
  AccountUser() {
    authService.getDetailCurrentUser().then((data) {
      user = data;
      exp = data.exp;
      notifyListeners();
    });
  }

  incrementExp(int newExp){
    exp = exp + newExp;
    notifyListeners();
  }
  decrementExp(int newExp){
    exp = exp - newExp;
    notifyListeners();
  }
}
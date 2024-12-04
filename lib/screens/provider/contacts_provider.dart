import 'package:flutter/material.dart';
import '../../models/user_model.dart';

class ContactsProvider extends ChangeNotifier {
  final List<UserModel> _items = [];

  List<UserModel> get items => _items;

  void addUser(UserModel user) {
    _items.add(user);
    notifyListeners();
  }

  void deleteUser(UserModel user) {
    _items.remove(user);
    notifyListeners();
  }

  void deleteLast() {
    if (_items.isNotEmpty) {
      _items.removeLast();
    }
    notifyListeners();
  }
}

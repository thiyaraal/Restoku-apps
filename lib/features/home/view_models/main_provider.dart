import 'package:flutter/material.dart';

class MainScreenProvider with ChangeNotifier {
  int _selectedNavbar = 0;

  int get selectedNavbar => _selectedNavbar;

  void changeSelectedNavbar(int index) {
    _selectedNavbar = index;
    notifyListeners();
  }

  void setInitialScreen(int index) {
    _selectedNavbar = index;
    notifyListeners();
  }
}

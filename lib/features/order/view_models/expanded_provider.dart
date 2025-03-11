import 'package:flutter/material.dart';

class ExpandableTextProvider extends ChangeNotifier {
  final Map<int, bool> _expandedStates = {};

  bool isExpanded(int id) => _expandedStates[id] ?? false;

  void toggleExpanded(int id) {
    _expandedStates[id] = !(_expandedStates[id] ?? false);
    notifyListeners();
  }
}

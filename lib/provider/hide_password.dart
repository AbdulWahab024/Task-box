
import 'package:flutter/material.dart';

class HidePassword with ChangeNotifier{
   bool _isActive = true;
  bool get hidePassword => _isActive;

  void toggle() {
    _isActive = !_isActive;
    notifyListeners();
  }
}
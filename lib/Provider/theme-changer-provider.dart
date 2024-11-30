import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier {
  var _thememode = ThemeMode.light;
  ThemeMode get thememode => _thememode;
  void setTheme(thememode) {
    _thememode = thememode;
    notifyListeners();
  }
}

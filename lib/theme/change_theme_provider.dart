import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final changeTheme = ChangeNotifierProvider.autoDispose((ref) {
  return ChangeThemeState();
});

class ChangeThemeState extends ChangeNotifier {
  bool darkMode = false;

  void enableDarkMode() {
    darkMode = true;
    notifyListeners();
  }

  void enableLightMode() {
    darkMode = false;
    notifyListeners();
  }
}

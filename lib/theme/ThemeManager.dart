import 'package:cardamage_detect/constants/StorageKey.dart';
import 'package:cardamage_detect/theme/DesignToken.dart';
import 'package:cardamage_detect/utils/MaterialColorGenerator.dart';
import 'package:cardamage_detect/utils/StorageManager.dart';
import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;
  ThemeData getTheme() => _themeData;
  bool isDark;

  final darkTheme = ThemeData(
      primarySwatch: generateMaterialColor(primary),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: gray9,
      primaryColor: gray7,
      accentColor: gray5,
      textTheme: TextTheme(
          headline3: TextStyle(color: white, fontWeight: FontWeight.w700),
          bodyText2: TextStyle(color: white),
          caption: TextStyle(color: gray5)));

  final lightTheme = ThemeData(
      primarySwatch: generateMaterialColor(primary),
      brightness: Brightness.light,
      scaffoldBackgroundColor: gray3,
      primaryColor: white,
      accentColor: gray5,
      textTheme: TextTheme(
          headline3: TextStyle(color: gray9, fontWeight: FontWeight.w700),
          bodyText2: TextStyle(color: gray9),
          caption: TextStyle(color: gray5)));

  ThemeNotifier() {
    StorageManager.readData(StorageKey.themeMode).then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
        isDark = false;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
        isDark = true;
      }
      notifyListeners();
    });
  }

  void changeTheme() async {
    StorageManager.readData(StorageKey.themeMode).then((themeMode) =>
        {if (themeMode == 'dark') setLightMode() else setDarkMode()});
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    isDark = true;
    StorageManager.saveData(StorageKey.themeMode, 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    isDark = false;
    StorageManager.saveData(StorageKey.themeMode, 'light');
    notifyListeners();
  }
}

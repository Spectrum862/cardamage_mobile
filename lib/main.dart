import 'package:cardamage_detect/theme/theme.dart';
import 'package:cardamage_detect/view/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: ThemeProvider.gray3,
        primaryColor: ThemeProvider.primary,
        brightness: Brightness.light,
      ),
      home: HomePage(),
    );
  }
}

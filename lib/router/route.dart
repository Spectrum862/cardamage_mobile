import 'package:cardamage_detect/view/home/home.dart';
import 'package:cardamage_detect/view/login/login.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static toHomePage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  static toLoginPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}

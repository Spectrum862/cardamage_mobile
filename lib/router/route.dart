import 'package:cardamage_datect/view/home/home.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static toHomePage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}

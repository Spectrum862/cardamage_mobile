import 'package:cardamage_detect/view/home/home.dart';
import 'package:cardamage_detect/widgets/Navbar.dart';
import 'package:flutter/material.dart';

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 16, left: 24, right: 24),
          child: Column(
            children: [
              Navbar(),
            ],
          ),
        ),
      ),
    );
  }
}

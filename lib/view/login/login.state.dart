import 'package:cardamage_detect/router/route.dart';
import 'package:cardamage_detect/view/login/login.dart';
import 'package:cardamage_detect/widgets/CTextField.dart';
import 'package:cardamage_detect/widgets/GradientButton.dart';
import 'package:flutter/material.dart';

class LoginPageState extends State<LoginPage> {
  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();

  void onLogin() {
    PageRouter.toHomePage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(right: 24, left: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hello',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                // style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              CTextField(
                hintText: 'Username',
                controller: id,
              ),
              SizedBox(
                height: 16,
              ),
              CTextField(
                hintText: 'Password',
                controller: password,
              ),
              SizedBox(
                height: 32,
              ),
              GradientButton(
                label: 'Sign In',
                onPress: () => PageRouter.toHomePage(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}

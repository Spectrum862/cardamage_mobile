import 'package:cardamage_datect/Router/route.dart';
import 'package:cardamage_datect/view/login/login.dart';
import 'package:flutter/material.dart';

class LoginPageState extends State<LoginPage> {
  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: 'username'),
                controller: id,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'password'),
                controller: password,
              ),
              ElevatedButton(
                child: Text('Login'),
                onPressed: () => PageRouter.toHomePage(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}

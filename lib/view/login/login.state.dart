import 'package:cardamage_datect/Router/route.dart';
import 'package:cardamage_datect/theme/util/HexColor.dart';
import 'package:cardamage_datect/view/login/login.dart';
import 'package:flutter/material.dart';

class LoginPageState extends State<LoginPage> {
  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode usernameNode;
  FocusNode passwordNode;

  @override
  void initState() {
    super.initState();
    usernameNode = FocusNode();
    passwordNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    usernameNode.dispose();
    passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f6f6f6'),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(right: 24, left: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hello',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
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
              TextFormField(
                focusNode: usernameNode,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: usernameNode.hasFocus
                      ? Color(0xFF262626)
                      : Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFFFFF)),
                      borderRadius: BorderRadius.circular(16)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#2663FF')),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'username',
                ),
                controller: id,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                focusNode: passwordNode,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: passwordNode.hasFocus
                      ? Color(0xFF262626)
                      : Color(0xFFFFFFFF),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Color(0xFFFFFF)),
                      borderRadius: BorderRadius.circular(16)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#2663FF')),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'password',
                ),
                controller: password,
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                child: SizedBox(
                  width: double.infinity,
                  height: 72,
                  child: Center(
                    child: Text('Sign In'),
                  ),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)))),
                onPressed: () => PageRouter.toHomePage(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}

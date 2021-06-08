import 'package:cardamage_detect/bloc/UserProfile/user_profile_cubit.dart';
import 'package:cardamage_detect/router/route.dart';
import 'package:cardamage_detect/view/login/login.dart';
import 'package:cardamage_detect/widgets/CTextField.dart';
import 'package:cardamage_detect/widgets/GradientButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPageState extends State<LoginPage> {
  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();

  void onLogin() async {
    try {
      await Provider.of<UserProfileCubit>(context, listen: false)
          .login(username: id.text, password: password.text);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProfileState = Provider.of<UserProfileCubit>(context).state;
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
                'CAR DAMAGE ESTIMATION SYSTEM',
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
                isPassword: true,
                hintText: 'Password',
                controller: password,
              ),
              SizedBox(
                height: 32,
              ),
              GradientButton(
                label: 'Sign In',
                loading: userProfileState is UserProfileLoading,
                onPress: () => onLogin(),
              ),
              Container(
                child: userProfileState is UserProfileError
                    ? Text(
                        userProfileState.errorMassage,
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.right,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

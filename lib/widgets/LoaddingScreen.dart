import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        alignment: Alignment.center,
        child: SpinKitFadingFour(
          color: Theme.of(context).textTheme.subtitle2.color,
          size: 40.0,
        ),
      ),
    );
  }
}

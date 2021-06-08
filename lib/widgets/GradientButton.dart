import 'package:cardamage_detect/theme/DesignToken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GradientButton extends StatefulWidget {
  final Function onPress;
  final Icon icon;
  final String label;
  final double height;
  final bool loading;

  GradientButton(
      {Key key,
      this.onPress,
      this.icon,
      this.label,
      this.height,
      this.loading = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GradientButton();
  }
}

class _GradientButton extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 72,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryLight, primary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(baseRadius)),
      child: widget.loading
          ? SpinKitRing(
              color: Colors.white,
              size: 40.0,
              lineWidth: 5,
            )
          : TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.icon != null
                      ? Container(
                          padding: EdgeInsets.only(right: 8),
                          child: widget.icon != null ? widget.icon : null,
                        )
                      : Container(),
                  Text(
                    widget.label,
                    style: TextStyle(color: Color(0xFFFFFFFF)),
                  )
                ],
              ),
              onPressed: widget.onPress,
            ),
    );
  }
}

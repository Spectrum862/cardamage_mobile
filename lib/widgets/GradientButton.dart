import 'package:cardamage_detect/theme/DesignToken.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  final Function onPress;
  final Icon icon;
  final String label;
  final double height;
  final bool loading;

  GradientButton(
      {Key key, this.onPress, this.icon, this.label, this.height, this.loading})
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
      child: TextButton(
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
        ),
        onPressed: widget.onPress,
      ),
    );
  }
}

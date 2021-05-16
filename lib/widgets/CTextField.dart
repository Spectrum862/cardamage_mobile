import 'package:cardamage_detect/theme/theme.dart';
import 'package:flutter/material.dart';

class CTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final bool small;
  CTextField(
      {Key key, this.hintText, this.controller, this.icon, this.small = false})
      : super(key: key);

  @override
  _CTextField createState() => _CTextField();
}

class _CTextField extends State<CTextField> {
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_requestFocus);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _requestFocus() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      decoration: InputDecoration(
        contentPadding: widget.small
            ? EdgeInsets.symmetric(vertical: 0.0)
            : EdgeInsets.symmetric(vertical: 20.0),
        prefixIcon: Icon(
          widget.icon,
          size: 20,
        ),
        filled: true,
        fillColor: _focusNode.hasFocus
            ? ThemeProvider.primary.withAlpha(15)
            : ThemeProvider.white,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ThemeProvider.white),
            borderRadius: widget.small
                ? BorderRadius.circular(ThemeProvider.smallRadius)
                : BorderRadius.circular(ThemeProvider.baseRadius)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeProvider.primary),
          borderRadius: widget.small
              ? BorderRadius.circular(ThemeProvider.smallRadius)
              : BorderRadius.circular(ThemeProvider.baseRadius),
        ),
        hintText: widget.hintText,
      ),
      style: TextStyle(fontSize: widget.small ? 14 : 14),
      controller: widget.controller,
    );
  }
}

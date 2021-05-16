import 'package:cardamage_detect/theme/theme.dart';
import 'package:flutter/material.dart';

class CTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  CTextField({Key key, this.hintText, this.controller}) : super(key: key);

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
        filled: true,
        fillColor: _focusNode.hasFocus
            ? ThemeProvider.primary.withAlpha(15)
            : ThemeProvider.white,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ThemeProvider.white),
            borderRadius: BorderRadius.circular(ThemeProvider.baseRadius)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeProvider.primary),
          borderRadius: BorderRadius.circular(ThemeProvider.baseRadius),
        ),
        hintText: widget.hintText,
      ),
      controller: widget.controller,
    );
  }
}

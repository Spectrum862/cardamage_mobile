import 'package:cardamage_detect/theme/DesignToken.dart';
import 'package:flutter/material.dart';

class CTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final bool small;
  final bool isPassword;
  CTextField(
      {Key key,
      this.hintText,
      this.controller,
      this.icon,
      this.small = false,
      this.isPassword = false})
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
      enableSuggestions: !widget.isPassword,
      autocorrect: !widget.isPassword,
      obscureText: widget.isPassword,
      decoration: InputDecoration(
        contentPadding: widget.small
            ? EdgeInsets.symmetric(vertical: 0.0)
            : EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
        prefixIcon: widget.icon != null
            ? Icon(
                widget.icon,
                size: 20,
                color: Theme.of(context).textTheme.caption.color,
              )
            : null,
        filled: true,
        fillColor: _focusNode.hasFocus
            ? primary.withAlpha(15)
            : Theme.of(context).primaryColor,
        hintStyle: Theme.of(context).textTheme.caption,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: widget.small
                ? BorderRadius.circular(smallRadius)
                : BorderRadius.circular(baseRadius)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: widget.small
              ? BorderRadius.circular(smallRadius)
              : BorderRadius.circular(baseRadius),
        ),
        hintText: widget.hintText,
      ),
      style: Theme.of(context).textTheme.bodyText2,
      controller: widget.controller,
    );
  }
}

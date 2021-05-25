import 'package:cardamage_detect/theme/theme.dart';
import 'package:cardamage_detect/widgets/CTextField.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  @override
  _Navbar createState() => _Navbar();
}

class _Navbar extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: CTextField(
          hintText: 'search',
          icon: Icons.search,
          small: true,
        )),
        SizedBox(width: 16),
        Icon(
          Icons.dark_mode,
          color: ThemeProvider.gray7,
          size: 30,
        ),
        SizedBox(width: 16),
        IconButton(
          icon: Icon(
            Icons.person_rounded,
            color: ThemeProvider.gray7,
            size: 30,
          ),
        ),
      ],
    );
  }
}

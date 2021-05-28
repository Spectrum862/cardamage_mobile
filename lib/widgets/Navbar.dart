import 'package:cardamage_detect/theme/ThemeManager.dart';
import 'package:cardamage_detect/widgets/CTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Navbar extends StatefulWidget {
  @override
  _Navbar createState() => _Navbar();
}

class _Navbar extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    final themeManger = Provider.of<ThemeNotifier>(context);
    return Row(
      children: [
        Flexible(
            child: CTextField(
          hintText: 'search',
          icon: Icons.search,
          small: true,
        )),
        SizedBox(width: 16),
        IconButton(
          icon: Icon(
            themeManger.isDark ? Icons.light_mode : Icons.dark_mode,
            color: Theme.of(context).textTheme.bodyText2.color,
            size: 30,
          ),
          onPressed: () => themeManger.changeTheme(),
        ),
        IconButton(
          icon: Icon(
            Icons.person_rounded,
            color: Theme.of(context).textTheme.bodyText2.color,
            size: 30,
          ),
        ),
      ],
    );
  }
}

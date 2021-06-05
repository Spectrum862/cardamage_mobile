import 'package:cardamage_detect/bloc/PredictedImages/predicted_images_cubit.dart';
import 'package:cardamage_detect/theme/ThemeManager.dart';
import 'package:cardamage_detect/view/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: MultiBlocProvider(
      providers: [BlocProvider(create: (_) => PredictedImagesCubit())],
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, theme, _) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme.getTheme(),
              home: LoginPage(),
            ));
  }
}

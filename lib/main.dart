import 'package:flutter/material.dart';
import 'package:parsowa/presentation/routers/router.dart';
import 'package:parsowa/presentation/screens/login/login_screen.dart';

import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final _appRouter = ;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: AppTheme.lightTheme,
      home: LoginScreen(title: "",),
      // home: DisplayCamera(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

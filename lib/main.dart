import 'package:flutter/material.dart';
import 'package:parsowa/presentation/routers/router.dart';
import 'package:parsowa/presentation/screens/fix_request_detail/content/content_fix_request_detail.dart';
import 'package:parsowa/presentation/screens/job_list/job_list_screen.dart';
import 'package:parsowa/presentation/screens/login/login_screen.dart';

import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';

import 'presentation/screens/account_regist/account_regist_screen.dart';
import 'presentation/screens/job_detail/complete/complete_screen.dart';
import 'presentation/screens/reset_password/reset_password_input_mail_screen.dart';

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
      home: AccountRegistScreen(),
      // LoginScreen(
      //   title: "",
      // ),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

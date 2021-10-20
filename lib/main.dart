import 'package:flutter/material.dart';
import 'package:parsowa/presentation/routers/router.dart';
import 'package:parsowa/presentation/screens/login/login_screen.dart';
import 'package:parsowa/presentation/screens/salary_detail/salary_detail.dart';

import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';
import 'presentation/screens/account_regist/account_regist_screen.dart';
import 'presentation/screens/account_regist/subscreens/display_camera_subscreen.dart';
import 'presentation/screens/account_regist/subscreens/image_attach_subscreen.dart';
import 'presentation/screens/attend_list/attend_list_screen.dart';
import 'presentation/screens/qr_code_read/qr_code_read_screen.dart';

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
      home: ImageAttachSubScreen(),
      // home: DisplayCamera(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

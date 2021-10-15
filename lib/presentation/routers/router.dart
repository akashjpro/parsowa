import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/strings.dart';
import 'package:parsowa/presentation/screens/attend_list/attend_list_screen.dart';
import 'package:parsowa/presentation/screens/attend_list/previous_attend_screen.dart';
import 'package:parsowa/presentation/screens/attend_list/record_screen.dart';
import 'package:parsowa/presentation/screens/contact_us/contact_us_screen.dart';
import 'package:parsowa/presentation/screens/fix_request_detail/completed/completed_fix_request_detail.dart';
import 'package:parsowa/presentation/screens/fix_request_detail/content/content_fix_request_detail.dart';
import 'package:parsowa/presentation/screens/home/home_screen.dart';
import 'package:parsowa/presentation/screens/job_detail/complete/complete_screen.dart';
import 'package:parsowa/presentation/screens/job_detail/confirm/confirm_screen.dart';
import 'package:parsowa/presentation/screens/job_detail/content/content_screen.dart';
import 'package:parsowa/presentation/screens/job_list/data/job_list_data.dart';
import 'package:parsowa/presentation/screens/job_list/job_list_screen.dart';
import 'package:parsowa/presentation/screens/login/login_screen.dart';
import 'package:parsowa/presentation/screens/make_job_record/make_job_record_screen.dart';
import 'package:parsowa/presentation/screens/my_page/my_page_screen.dart';
import 'package:parsowa/presentation/screens/qr_code_read/qr_code_read_screen.dart';
import 'package:parsowa/presentation/screens/reset_password/reset_password_input_mail_screen.dart';
import 'package:parsowa/presentation/screens/reset_password/reset_password_screen.dart';
import 'package:parsowa/presentation/screens/search/search_screen.dart';

// @MaterialAutoRouter(replaceInRouteName: "Page,Route", routes: [
//   AutoRoute(path: Paths.homePath, page: HomeScreen, children: [
//     AutoRoute(
//         path: Paths.searchPath,
//         name: Strings.searchScreenName,
//         page: SearchScreen),
//     AutoRoute(
//         path: Paths.jobListPath,
//         name: Strings.jobListScreenName,
//         page: JobListScreen),
//     AutoRoute(
//         path: Paths.attendListPath,
//         name: Strings.attendListScreenName,
//         page: AttendListScreen),
//     AutoRoute(
//         path: Paths.jobRecordPath,
//         name: Strings.jobRecordScreenName,
//         page: JobRecordScreen),
//     AutoRoute(
//         path: Paths.myPagePath,
//         name: Strings.myPageScreenName,
//         page: MyPageScreen)
//   ])
// ])
// class $AppRouter {}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(title: 'Home'));
      case JobListScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => JobListScreen(
            title: Strings.jobListTitle,
          ),
        );
      case ContentJobDetailScreen.routeName:
        // Validation of correct data type
        if (args is JobData) {
          return MaterialPageRoute(
            builder: (_) => ContentJobDetailScreen(
                title: Strings.contentJobDetailTitle, job: args),
          );
        }

        return _errorRoute();
      case ConfirmJobDetailScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ConfirmJobDetailScreen(),
        );
      case CompleteJobDetailScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const CompleteJobDetailScreen(),
        );
      case SearchScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(title: Strings.searchScreenName),
        );
      case AttendListScreen.routeName:
        return MaterialPageRoute(
          builder: (_) =>
              const AttendListScreen(title: Strings.attendListTitle),
        );
      case RecordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const RecordScreen(title: Strings.recordTitle),
        );
      case PreviousAttendScreen.routeName:
        return MaterialPageRoute(
          builder: (_) =>
              const PreviousAttendScreen(title: Strings.recordTitle),
        );
      case MakeJobRecordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) =>
              const MakeJobRecordScreen(title: Strings.jobRecordScreenName),
        );
      case MyPageScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const MyPageScreen(title: Strings.myPageScreenName),
        );
      case QRCodeReadScreen.routeName:
        return MaterialPageRoute(
          builder: (_) =>
              const QRCodeReadScreen(title: Strings.qrCodeReadTitle),
        );
      case ContentsFixRequestDetailScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ContentsFixRequestDetailScreen(),
        );
      case CompleteFixRequestDetailScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const CompleteFixRequestDetailScreen(),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(title: ""),
        );
      case RestPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const RestPasswordScreen(),
        );
      case RestPasswordInputMailScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const RestPasswordInputMailScreen(),
        );
      case ContactUsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ContactUsScreen(),
        );

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

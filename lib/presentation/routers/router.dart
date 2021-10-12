import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/paths.dart';
import 'package:parsowa/core/constants/strings.dart';
import 'package:parsowa/presentation/screens/attend_list_screen/attend_list_screen.dart';
import 'package:parsowa/presentation/screens/attend_list_screen/previous_attend_screen.dart';
import 'package:parsowa/presentation/screens/attend_list_screen/record_screen.dart';
import 'package:parsowa/presentation/screens/home_screen/home_screen.dart';
import 'package:parsowa/presentation/screens/job_detail/complete/complete_screen.dart';
import 'package:parsowa/presentation/screens/job_detail/confirm/confirm_screen.dart';
import 'package:parsowa/presentation/screens/job_detail/content/content_screen.dart';
import 'package:parsowa/presentation/screens/job_list_screen/data/job_list_data.dart';
import 'package:parsowa/presentation/screens/job_list_screen/job_list_screen.dart';
import 'package:parsowa/presentation/screens/job_record_screen/job_record_screen.dart';
import 'package:parsowa/presentation/screens/my_page_screen/my_page_screen.dart';
import 'package:parsowa/presentation/screens/search_screen/search_screen.dart';

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
          builder: (_) => const AttendListScreen(title: Strings.attendListTitle),
        );
      case RecordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const RecordScreen(title: Strings.recordTitle),
        );
      case PreviousAttendScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const PreviousAttendScreen(title: Strings.recordTitle),
        );
      case JobRecordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const JobRecordScreen(title: Strings.jobRecordScreenName),
        );
      case MyPageScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const MyPageScreen(title: Strings.myPageScreenName),
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

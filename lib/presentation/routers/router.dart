import 'package:auto_route/annotations.dart';
import 'package:parsowa/core/constants/paths.dart';
import 'package:parsowa/core/constants/strings.dart';
import 'package:parsowa/presentation/screens/attend_list_screen/attend_list_screen.dart';
import 'package:parsowa/presentation/screens/home_screen/home_screen.dart';
import 'package:parsowa/presentation/screens/job_list_screen/job_list_screen.dart';
import 'package:parsowa/presentation/screens/job_record_screen/job_record_screen.dart';
import 'package:parsowa/presentation/screens/my_page_screen/my_page_screen.dart';
import 'package:parsowa/presentation/screens/search_screen/search_screen.dart';

@MaterialAutoRouter(
    replaceInRouteName: "Page,Route",
    routes: [AutoRoute(path: Paths.homePath, page: HomeScreen, children: [
      AutoRoute(path: Paths.searchPath, name: Strings.searchScreenName, page: SearchScreen),
      AutoRoute(path: Paths.jobListPath, name: Strings.jobListScreenName, page: JobListScreen),
      AutoRoute(path: Paths.attendListPath, name: Strings.attendListScreenName, page: AttendListScreen),
      AutoRoute(path: Paths.jobRecordPath, name: Strings.jobRecordScreenName, page: JobRecordScreen),
      AutoRoute(path: Paths.myPagePath, name: Strings.myPageScreenName, page: MyPageScreen)
    ])])
class $AppRouter {}

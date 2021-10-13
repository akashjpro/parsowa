import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/attend_list/attend_list_screen.dart';
import 'package:parsowa/presentation/screens/job_list/job_list_screen.dart';
import 'package:parsowa/presentation/screens/make_job_record/make_job_record_screen.dart';
import 'package:parsowa/presentation/screens/my_page/my_page_screen.dart';
import 'package:parsowa/presentation/screens/search/search_screen.dart';

class BottomNavBar extends StatefulWidget {
  var currentIndex = 0;

  BottomNavBar({Key? key, int? currentIndex}) : super(key: key) {
    this.currentIndex = currentIndex ?? 0;
  }

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/icon_svg/Search_icon_on.svg'),
            label: '探す',
            activeIcon:
                _buildIconActive('assets/icons/icon_svg/Search_icon_on.svg')),
        BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/icon_svg/JobList_icon.svg'),
            label: '申込中',
            activeIcon:
                _buildIconActive('assets/icons/icon_svg/JobList_icon.svg')),
        BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/icon_svg/AttendList_icon.svg'),
            label: '出勤/退勤',
            activeIcon:
                _buildIconActive('assets/icons/icon_svg/AttendList_icon.svg')),
        BottomNavigationBarItem(
            icon:
                // Icon(Icons.access_alarm),
                _buildIcon('assets/icons/icon_svg/Job_Record_icon.svg'),
            label: '記録',
            activeIcon:
                _buildIconActive('assets/icons/icon_svg/Job_Record_icon.svg')),
        BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/icon_svg/Mypage_icon.svg'),
            label: 'マイページ',
            activeIcon:
                _buildIconActive('assets/icons/icon_svg/Mypage_icon.svg')),
      ],
      currentIndex: widget.currentIndex,
      selectedItemColor: AppColors.primaryColor,
      backgroundColor: AppColors.whiteColor,
      showUnselectedLabels: true,
      unselectedLabelStyle: const TextStyle(
          color: AppColors.unselectedLabelNavBottomColor,
          fontFamily: "NotoSanJP",
          fontWeight: FontWeight.w400),
      unselectedItemColor: AppColors.unselectedItemNavBottomColor,
      selectedFontSize: 12.0,
      selectedLabelStyle: const TextStyle(
          color: AppColors.primaryColor,
          fontFamily: "NotoSanJP",
          fontWeight: FontWeight.w400),
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.of(context).pushReplacementNamed(SearchScreen.routeName);
            break;
          case 1:
            Navigator.of(context).pushReplacementNamed(JobListScreen.routeName);
            break;
          case 2:
            Navigator.of(context).pushReplacementNamed(AttendListScreen.routeName);
            break;
          case 3:
            Navigator.of(context).pushReplacementNamed(MakeJobRecordScreen.routeName);
            break;
          case 4:
            Navigator.of(context).pushReplacementNamed(MyPageScreen.routeName);
            break;
        }
      },
    );
  }

  _buildIcon(String assets) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        assets,
        width: 20.0,
        height: 20.0,
      ),
    );
  }

  _buildIconActive(String assets) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        assets,
        width: 20.0,
        height: 20.0,
        color: AppColors.primaryColor,
      ),
    );
  }
}

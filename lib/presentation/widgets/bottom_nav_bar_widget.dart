import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parsowa/core/constants/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

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
      currentIndex: 0,
      selectedItemColor: AppColors.primaryColor,
      backgroundColor: AppColors.whiteColor,
      showUnselectedLabels: true,
      unselectedLabelStyle:
          const TextStyle(color: AppColors.unselectedLabelNavBottomColor),
      unselectedItemColor: AppColors.unselectedItemNavBottomColor,
      selectedFontSize: 12.0,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {},
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

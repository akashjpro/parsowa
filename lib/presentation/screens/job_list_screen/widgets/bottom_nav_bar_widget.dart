import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            // SvgPicture.asset('assets/icons/icon_svg/Mypage_icon.svg'),
            label: 'default'),
        BottomNavigationBarItem(
            icon: const Icon(Icons.receipt_rounded), label: 'default'),
        BottomNavigationBarItem(
            icon: const Icon(Icons.menu_outlined), label: 'default'),
        BottomNavigationBarItem(
            icon: const Icon(Icons.receipt_rounded), label: 'default'),
        BottomNavigationBarItem(
            icon: const Icon(Icons.person), label: 'default'),
      ],
      currentIndex: 2,
      selectedItemColor: const Color(0xFFF5AA56),
      showUnselectedLabels: true,
      unselectedLabelStyle: const TextStyle(color: Color(0xFF2C2C2C)),
      unselectedItemColor: const Color(0xFF2C2C2C),
      selectedFontSize: 12.0,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {},
    );
  }
}

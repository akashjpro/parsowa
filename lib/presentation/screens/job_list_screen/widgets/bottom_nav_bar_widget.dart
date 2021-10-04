import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.ac_unit_sharp), label: 'default'),
        BottomNavigationBarItem(
            icon: const Icon(Icons.ac_unit_sharp), label: 'default'),
        BottomNavigationBarItem(
            icon: const Icon(Icons.ac_unit_sharp), label: 'default'),
        BottomNavigationBarItem(
            icon: const Icon(Icons.ac_unit_sharp), label: 'default'),
        BottomNavigationBarItem(
            icon: const Icon(Icons.ac_unit_sharp), label: 'default'),
      ],
      currentIndex: 0,
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

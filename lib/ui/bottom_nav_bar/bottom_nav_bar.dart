import 'package:flutter/material.dart';
import 'package:flutter_radixweb/ui/bottom_nav_bar/bottom_app_bar.dart';
import 'package:flutter_radixweb/ui/home/screen/home_page.dart';
import 'package:flutter_radixweb/ui/profile/screen/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  static String tag = 'bottom-nav-bar';

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  List<Widget> _tabsList = <Widget>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tabsList = <Widget>[
      HomePage(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: _tabsList[_selectedIndex],
      bottomNavigationBar: FABBottomAppBar(
        onTabSelected: _selectedTab,
        modifiedIndex: _selectedIndex,
        items: [
          FABBottomAppBarItem(
              selectedIcon: Icons.home,
              text: "Home",
              index: 0),
          FABBottomAppBarItem(
              selectedIcon: Icons.person,
              text: "Profile",
              index: 1),
        ],
      ),
    );
  }

  void _selectedTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

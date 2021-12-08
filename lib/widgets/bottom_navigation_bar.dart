// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyBottomNavigation extends StatefulWidget {
  int _selectedIndex = 0;

  MyBottomNavigation({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  void _onItemTapped(int index) {
    setState(() {
      widget._selectedIndex = index;
      if (index == 1) {
        Navigator.of(context).pushNamed('/profile_page');
      } else if (index == 0) {
        Navigator.of(context).pushNamed('/profile_page');
      } else if (index == 2) {
        logOut(context);
      }
    });
  }

  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // Navigator.pushReplacementNamed(context, '/login_screen');
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/login_screen', (Route<dynamic> route) => false);
  }

  final List<IconData> _bottomIcons = [
    FontAwesomeIcons.search,
    FontAwesomeIcons.userCircle,
    FontAwesomeIcons.signOutAlt,
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(_bottomIcons[0]),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(_bottomIcons[1]),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(_bottomIcons[2]),
            label: 'Log Out',
          ),
        ],
        currentIndex: widget._selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped);
  }
}

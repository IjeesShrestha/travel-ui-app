import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyBottomNavigation extends StatefulWidget {
  int _selectedIndex = 0;

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  void _onItemTapped(int index) {
    setState(() {
      widget._selectedIndex = index;
    });
  }

  final List<IconData> _bottomIcons = [
    FontAwesomeIcons.search,
    FontAwesomeIcons.utensils,
    FontAwesomeIcons.userCircle,
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
            label: 'Café',
          ),
          BottomNavigationBarItem(
            icon: Icon(_bottomIcons[2]),
            label: 'Profile',
          ),
        ],
        currentIndex: widget._selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped);
  }
}

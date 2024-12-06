import 'package:flutter/material.dart';
import 'package:pa_hasbi/model/theme-mode.dart';
import 'package:pa_hasbi/screens/book-klasifikasi.dart';
import 'package:pa_hasbi/screens/home.dart';
import 'package:provider/provider.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MyHome(),
    MyBookClassification(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Color.fromRGBO(33, 64, 91, 1)
                        : Color.fromRGBO(147, 198, 231, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Predict Booking',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Color.fromRGBO(147, 198, 231, 1)
                        : Color.fromRGBO(33, 64, 91, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}

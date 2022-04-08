import 'package:flutter/material.dart';

import 'to_do_only_later.dart';
import 'to_do_only_not_done.dart';
import 'to_do_screen.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ToDoScreen(),
    OnlyLater(),
    OnlyNotDone(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_alarm,
              color: Colors.green,
            ),
            label: 'Tüm Yapılacaklar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.watch_later_outlined,
              color: Colors.orangeAccent,
            ),
            label: 'Ertelenenler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.not_interested_sharp, color: Colors.red),
            label: 'Yapılmayanlar',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: _selectedIndex == 0
            ? Colors.green
            : _selectedIndex == 1
                ? Colors.orangeAccent
                : Colors.red,
        onTap: _onItemTapped,
        selectedFontSize: 15,
      ),
    );
  }
}

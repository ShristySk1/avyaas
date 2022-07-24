import 'package:avyaas/features/presentation/dashboard/discussion/discussion.dart';
import 'package:avyaas/features/presentation/dashboard/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedIndex = 0;
  var _pages = [HomePage(), DiscussionPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            backgroundColor: Colors.white10,
            // elevation: 0,
            //         showSelectedLabels: false,
            // showUnselectedLabels: false,
            iconSize: 24,
            onTap: (value) => _setIndex(value),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.mail), label: "Discussion"),
            ]),
        body: _pages[_selectedIndex]);
  }

  _setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

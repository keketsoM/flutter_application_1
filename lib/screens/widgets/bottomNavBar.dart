import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/route.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    super.key,
    this.myIndex = 0,
  });

  int myIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          widget.myIndex = index;
        });
        switch (index) {
          case 0:
            Navigator.of(context).popAndPushNamed(Routemanger.homePage);
            break;
          case 1:
            Navigator.of(context).popAndPushNamed(Routemanger.homePage);
            break;
          case 2:
            Navigator.of(context).popAndPushNamed(Routemanger.homePage);
            break;
          case 3:
            Navigator.of(context).popAndPushNamed(Routemanger.homePage);
            break;
        }
      },
      currentIndex: widget.myIndex,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.search_outlined),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.chat),
          label: 'chat',
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.person),
            label: 'Profile'),
      ],
    );
  }
}

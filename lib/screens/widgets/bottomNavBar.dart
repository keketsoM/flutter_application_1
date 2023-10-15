import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/route_mananger/route.dart';

final _firebase = FirebaseAuth.instance;

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
            Navigator.of(context).popAndPushNamed(Routemanger.sixthPage);
            break;
          case 2:
            Navigator.of(context).popAndPushNamed(Routemanger.chatScreen);
            break;
          case 3:
            _firebase.signOut();
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
            icon: Icon(Icons.exit_to_app),
            label: 'Logout'),
      ],
    );
  }
}

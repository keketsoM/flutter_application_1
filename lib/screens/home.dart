import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cartScreen.dart';
import 'package:flutter_application_1/screens/homePage.dart';
import 'package:flutter_application_1/screens/user_profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
     const CartList(),
    const  PersonProfile(),
    ];
    return  Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 50,
          currentIndex: _currentIndex,
          selectedItemColor: const Color.fromARGB(136, 4, 185, 240),
          onTap: (value) {
            setState(() {
              _currentIndex = value;

            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag,
                  color: Colors.blue,
                ),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                label: "Profile"),
          ]),
    );
  }
}
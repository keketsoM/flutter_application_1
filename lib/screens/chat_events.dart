import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/chat.dart';
import 'package:flutter_application_1/screens/events.dart';
import 'package:flutter_application_1/screens/route.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
         
          title: const Text("Ask My Peers"),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.chat),
              text: "ChatBoard",
            ),
            Tab(
              icon: Icon(Icons.event),
              text: "Events",
            ),
          ]),
        ),
        drawer: Drawer(
          
          width: 200,
          child: Column(
            children: [
               DrawerHeader(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:  Image.asset('assests/images/StudentFest.png')
              ),
            ),
              Padding(
              padding: const EdgeInsets.only(top: 20, left: 15),
              child: Row(
                children: [
                  const Text(
                    "Student Fest",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 40,),
                  IconButton(onPressed: (){
                    Navigator.of(context).pushNamed(Routemanger.home);
                  }, icon: Icon(Icons.home))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Text(
                    "Services",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 65,
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.room_service)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Text(
                    "Orders",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 75,
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Text(
                    "Reports",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.report)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Text(
                    "Log out",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      icon: const Icon(Icons.exit_to_app)),
                ],
              ),
            )
            ],
          ),
        ),
        body:  const  TabBarView(children: [
          ChatScreen(),
          EventsScreen(),
        ]),
      ),
    );
  }
}
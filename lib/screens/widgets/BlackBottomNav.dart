import 'package:flutter/material.dart';

class BlackBottomNav extends StatefulWidget {
  const BlackBottomNav({
    super.key,
    required this.name,
    required this.pageName,
  });
  final String name;
  final String pageName;

  @override
  State<BlackBottomNav> createState() => _BlackBottomNavState();
}

class _BlackBottomNavState extends State<BlackBottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                if (widget.name == 'pay Now') {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Payment Recieved. Thank you")));

                  Navigator.of(context).popAndPushNamed(widget.pageName);
                }
              },
              child: Text(
                widget.name,
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

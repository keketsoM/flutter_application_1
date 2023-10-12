import 'package:flutter/material.dart';

class DrawerBar extends StatelessWidget {
  const DrawerBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Container(
              child: Column(
                children: [CircleAvatar()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

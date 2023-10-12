import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/category_model.dart';
import 'package:flutter_application_1/screens/route.dart';

class ShopDep extends StatefulWidget {
  const ShopDep({super.key, required this.categories});
  final Category categories;

  @override
  State<ShopDep> createState() => _ShopDepState();
}

class _ShopDepState extends State<ShopDep> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            InkWell(
              focusColor: Colors.blue,
              onTap: () {
                Navigator.of(context).pushNamed(Routemanger.secondPage,
                    arguments: widget.categories);
              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(widget.categories.imageUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                widget.categories.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

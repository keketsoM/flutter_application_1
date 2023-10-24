import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/models.dart';
import 'package:flutter_application_1/model/product.dart';

import 'package:flutter_application_1/route_mananger/route.dart';

class CardSearch extends StatefulWidget {
  const CardSearch(
      {super.key,
      required this.product,
      required this.index,
      required this.state,
      this.widthfactor = 2.5,
      this.leftPostion = 5});

  final dynamic product;
  final double widthfactor;
  final double leftPostion;
  final ProductApiFetchingSuccessfulState state;
  final int index;

  @override
  State<CardSearch> createState() => _CardSearchState();
}

class _CardSearchState extends State<CardSearch> {
  String nameLimiter(String name) {
    if (name.length > 10) {
      return name.substring(0, 20);
    } else {
      return name;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double widthValue =
        MediaQuery.of(context).size.width / widget.widthfactor;
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routemanger.thirdPage, arguments: widget.product);
      },
      child: Column(
        children: [
          Card(
            child: Container(
              height: 156,
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    widget.product.imageLink,
                    fit: BoxFit.fill,
                    height: 100,
                    width: 160,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${nameLimiter(widget.product.productName)}\nR${widget.product.productPrice}',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/models.dart';

import 'package:flutter_application_1/model/services.dart';
import 'package:flutter_application_1/route_mananger/route.dart';

class ServicesCard extends StatefulWidget {
  const ServicesCard(
      {super.key,
      required this.service,
      required this.index,
      required this.state,
      this.widthfactor = 2.5,
      this.leftPostion = 5});

  final Services service;
  final double widthfactor;
  final double leftPostion;
  final ProductApiFetchingSuccessfulState state;
  final int index;

  @override
  State<ServicesCard> createState() => _ServicesCardState();
}

class _ServicesCardState extends State<ServicesCard> {
  String nameLimiter(String name) {
    if (name.length > 10) {
      return name.substring(0, 13);
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
            .pushNamed(Routemanger.seviceScreen, arguments: widget.service);
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
                    widget.service.imageUrl,
                    fit: BoxFit.fill,
                    height: 100,
                    width: 160,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${nameLimiter(widget.service.serviceName)}',
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

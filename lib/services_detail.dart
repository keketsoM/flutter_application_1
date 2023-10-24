import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/blocs/blocs.dart';

import 'package:flutter_application_1/model/services.dart';
import 'package:flutter_application_1/route_mananger/route.dart';
import 'package:flutter_application_1/screens/widgets/common_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceDetailScreen extends StatefulWidget {
  const ServiceDetailScreen({super.key, required this.service});
  final Services service;
  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routemanger.fivePage);
                },
                icon: Icon(Icons.shopping_bag_outlined))
          ],
          title: Text(widget.service.serviceName),
        ),
        body: BlocBuilder<ApiProductBloc, ApiProductState>(
          builder: (context, state) {
            if (state is ProductApiLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductApiFetchingSuccessfulState) {
              return ListView(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.0,
                      viewportFraction: 1.0,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      autoPlay: true,
                    ),
                    items: [
                      // CarouselCat(
                      // //  product: widget.service,
                      //   category: null,
                      // )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          alignment: Alignment.bottomCenter,
                          color: Colors.black.withAlpha(50),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          width: MediaQuery.of(context).size.width - 10,
                          height: 50,
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.service.serviceName,
                                  style: TextStyle(color: Colors.white),
                                ),
                                // Text(
                                //   'R${widget.products.productPrice}',
                                //   style: TextStyle(color: Colors.white),
                                // ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ExpansionTile(
                      initiallyExpanded: false,
                      title: Text('Product Information'),
                      children: [
                        ListTile(
                          title: Text(widget.service.serviceDescription),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ExpansionTile(
                      initiallyExpanded: false,
                      title: Text('Delivery Information'),
                      children: [
                        ListTile(
                          title: Text(widget.service.serviceDescription),
                        )
                      ],
                    ),
                  ),
                  // ProductRow(
                  //   services: state.services
                  //       .where((services) =>
                  //           services.serviceName.trim().contains("Gadets"))
                  //       .toList(),
                  //   products: [],
                  // ),
                ],
              );
            } else {
              return Text("Something went wrong");
            }
          },
        ),
        bottomNavigationBar: BottomNavBar());
  }
}

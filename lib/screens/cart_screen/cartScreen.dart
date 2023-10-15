import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/blocs/cart/cart_bloc.dart';
import 'package:flutter_application_1/model/blocs/cart/cart_state.dart';
import 'package:flutter_application_1/model/cart.dart';
import 'package:flutter_application_1/route_mananger/route.dart';
import 'package:flutter_application_1/screens/widgets/BlackBottomNav.dart';
import 'package:flutter_application_1/screens/widgets/OrderSummary.dart';
import 'package:flutter_application_1/screens/widgets/cart_product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading)
            return const Center(
              child: CircularProgressIndicator(),
            );
          if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${const Cart().freedeliveryString}",
                                style: const TextStyle(color: Colors.black),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .popAndPushNamed(Routemanger.homePage);
                                },
                                child: const Text(
                                  'Add More Items',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              itemCount: state.cart.products.length,
                              itemBuilder: (context, index) {
                                return CartProductCard(
                                  product: state.cart.products[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const Order_Summary(),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Text("Something went wrong");
          }
        },
      ),
      bottomNavigationBar: const BlackBottomNav(
        name: 'pay Now',
        pageName: Routemanger.homePage,
      ),
    );
  }
}

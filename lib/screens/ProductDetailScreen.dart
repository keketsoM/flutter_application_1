import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/blocs/cart/cart_bloc.dart';
import 'package:flutter_application_1/model/blocs/cart/cart_event.dart';
import 'package:flutter_application_1/model/blocs/cart/cart_state.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/screens/route.dart';
import 'package:flutter_application_1/screens/widgets/carouselHome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.products});
  final Product products;
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
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
        // title: Text(widget.products.name),
      ),
      body: ListView(
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
              CarouselCat(
                product: widget.products,
                category: null,
              )
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
                        //   Text(
                        // widget.products.name,
                        //   style: TextStyle(color: Colors.white),
                        // ),
                        Text(
                          'R${widget.products.price}',
                          style: TextStyle(color: Colors.white),
                        ),
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
                // ListTile(
                //   title: Text(widget.products.description),
                // )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: false,
              title: Text('Delivery Information'),
              children: [
                // ListTile(
                //   title: Text(widget.products.description),
                // )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routemanger.fourthPage);
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(CartProductAdded(widget.products));
                    },
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

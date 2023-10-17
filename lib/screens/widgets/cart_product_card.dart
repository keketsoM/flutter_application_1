import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(
            product.imageLink,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.productName),
                Text("R${product.productPrice}"),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductRemove(product));
                    },
                    icon: Icon(Icons.remove_circle),
                  ),
                  Text("1"),
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductAdded(product));
                    },
                    icon: Icon(Icons.add_circle),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

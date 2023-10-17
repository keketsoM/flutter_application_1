import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/models.dart';
import 'package:flutter_application_1/route_mananger/route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductWishListCard extends StatefulWidget {
  const ProductWishListCard(
      {super.key, required this.product, this.isWishList = false});
  final Product product;
  final bool isWishList;

  @override
  State<ProductWishListCard> createState() => _ProductWishListCardState();
}

class _ProductWishListCardState extends State<ProductWishListCard> {
  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / 2.5;
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routemanger.thirdPage, arguments: widget.product);
      },
      child: Row(
        children: [
          Stack(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 250,
                    child: Row(
                      children: [
                        Image.network(
                          widget.product.imageLink,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            '${widget.product.productName}\n${widget.product.productPrice}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 5,
                left: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  //Text('${product.discount}%'),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(CartProductAdded(widget.product));
                          context
                              .read<WishListBloc>()
                              .add(RemoveWishListProduct(widget.product));
                          final snackBar =
                              SnackBar(content: Text('item add to the cart!'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        icon: Icon(Icons.trolley),
                      );
                    },
                  ),
                ),
              ),
              widget.isWishList
                  ? Positioned(
                      bottom: 5,
                      right: 60,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.blue),
                        child: BlocBuilder<WishListBloc, WishListState>(
                          builder: (context, state) {
                            return IconButton(
                              onPressed: () {
                                context.read<WishListBloc>().add(
                                    RemoveWishListProduct(widget.product!));

                                final snackBar = SnackBar(
                                    content:
                                        Text('Removed from the wishlist!'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: Icon(Icons.delete),
                            );
                          },
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}

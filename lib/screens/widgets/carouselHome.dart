import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/models.dart';
import 'package:flutter_application_1/model/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselCat extends StatelessWidget {
  const CarouselCat({required this.category, required this.product});
  final Category? category;
  final Product? product;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
                product == null ? category!.imageUrl : product!.imageLink,
                fit: BoxFit.fill,
                width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Text(
                  product == null ? category!.name : "",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (category == null)
              Positioned(
                top: 5,
                right: 5,
                child: BlocBuilder<WishListBloc, WishListState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        context
                            .read<WishListBloc>()
                            .add(AddWishListProduct(product!));

                        final snackBar =
                            SnackBar(content: Text('Added to your wishlist!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}

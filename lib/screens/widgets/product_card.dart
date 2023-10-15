import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/screens/route.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.product,
      this.widthfactor = 2.5,
      this.leftPostion = 5});
  final Product product;
  final double widthfactor;
  final double leftPostion;
  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthfactor;
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routemanger.thirdPage, arguments: product);
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
                    product.imageUrl,
                    fit: BoxFit.fill,
                    height: 100,
                    width: 160,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${product.productName}\nR${product.price}',
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

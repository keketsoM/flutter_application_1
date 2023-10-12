import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/screens/widgets/product_card.dart';

class ProductRow extends StatelessWidget {
  final List<Product> products;
  const ProductRow({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ProductCard(
              product: products[index],
              widthfactor: 2.5,
            ),
          );
        },
      ),
    );
  }
}

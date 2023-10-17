import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/models.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/screens/widgets/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductRow extends StatefulWidget {
  final List<Product> products;
  const ProductRow({super.key, required this.products});

  @override
  State<ProductRow> createState() => _ProductRowState();
}

class _ProductRowState extends State<ProductRow> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: BlocBuilder<ApiProductBloc, ApiProductState>(
        builder: (context, state) {
          if (state is ProductApiLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductApiFetchingSuccessfulState) {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ProductCard(
                    index: index,
                    state: state,
                    product: state.products[index],
                    widthfactor: 2.5,
                  ),
                );
              },
            );
          } else {
            return Text("Something went wrong");
          }
        },
      ),
    );
  }
}

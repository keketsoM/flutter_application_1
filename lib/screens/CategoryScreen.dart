import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/category_model.dart';
import 'package:flutter_application_1/model/models.dart';
import 'package:flutter_application_1/screens/widgets/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.categories});
  final Category categories;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Product> allproducts = [];
  @override
  Widget build(BuildContext context) {
    final List<Product> productCategory = allproducts
        .where((products) =>
            products.productCategory.toLowerCase() ==
            widget.categories.name.toLowerCase())
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categories.name),
      ),
      body: BlocBuilder<ApiProductBloc, ApiProductState>(
        builder: (context, state) {
          if (state is ProductApiLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductApiFetchingSuccessfulState) {
            allproducts = state.products;
            return GridView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1),
              itemCount: productCategory.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ProductCard(
                      product: productCategory[index],
                      widthfactor: 2.5,
                      index: index,
                      state: state,
                    ),
                  ),
                );
              },
            );
          } else {
            return Text("Error State: ${state} something is wrong");
          }
        },
      ),
    );
  }
}

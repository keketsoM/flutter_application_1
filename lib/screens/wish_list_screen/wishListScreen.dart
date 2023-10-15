import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/models.dart';
import 'package:flutter_application_1/screens/widgets/productWishListCard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({
    super.key,
  });

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WishList'),
      ),
      body: BlocBuilder<WishListBloc, WishListState>(
        builder: (context, state) {
          if (state is WishListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishListLoaded) {
            return WishListItem(state: state);
          } else {
            return Text("Something went wrong");
          }
        },
      ),
    );
  }
}

class WishListItem extends StatelessWidget {
  final WishListLoaded state;

  const WishListItem({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 17.0,
        horizontal: 8.0,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 2.4),
      itemCount: state.wishList.products.length,
      itemBuilder: (context, index) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ProductWishListCard(
              product: state.wishList.products[index],
              isWishList: true,
            ),
          ),
        );
      },
    );
  }
}

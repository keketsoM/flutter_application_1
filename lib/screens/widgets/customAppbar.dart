import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/blocs/cart/cart_bloc.dart';
import 'package:flutter_application_1/model/blocs/cart/cart_state.dart';
import 'package:flutter_application_1/screens/route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 50,
            width: 320,
            child: TextField(
              onTap: () => Navigator.of(context).popAndPushNamed(
                Routemanger.sixthPage,
              ),
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search....',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.00),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      actions: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Badge(
                label: state is CartLoaded
                    ? Text('${state.cart.products.length}')
                    : const Text("0"),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routemanger.fivePage);
                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
              );
            },
          ),
        ),
      ],
      title: Text("TRADE HUB"),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}

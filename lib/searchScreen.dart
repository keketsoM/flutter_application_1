import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/blocs/cart/cart_bloc.dart';
import 'package:flutter_application_1/model/blocs/cart/cart_state.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/screens/route.dart';
import 'package:flutter_application_1/screens/widgets/bottomNavBar.dart';
import 'package:flutter_application_1/screens/widgets/drawer.dart';
import 'package:flutter_application_1/screens/widgets/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product> filteredItem = [];
  void filterItem(String keyword) {
    setState(
      () {
        if (keyword.isEmpty) {
          Text("no iteam found");
        } else {
          // filteredItem = Product.products
          //     .where((element) =>
          //         element.name.toLowerCase().contains(keyword.toLowerCase()))
          //     .toList();
        }
      },
    );
  }

  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    //filteredItem = Product.products.toList();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 50,
              width: 320,
              child: TextField(
                onChanged: (value) => filterItem(value),
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
                    icon: Icon(Icons.shopping_cart),
                  ),
                );
              },
            ),
          ),
        ],
        title: Center(child: const Text("Student Fest")),
      ),
      drawer: DrawerBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 8.0,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1),
        itemCount: filteredItem.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: ProductCard(
                product: filteredItem[index],
                widthfactor: 2.5,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

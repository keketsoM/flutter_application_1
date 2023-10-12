import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/blocs/cart/cart_bloc.dart';
import 'package:flutter_application_1/model/blocs/cart/cart_state.dart';
import 'package:flutter_application_1/model/category_model.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/screens/route.dart';
import 'package:flutter_application_1/screens/widgets/carouselHome.dart';
import 'package:flutter_application_1/screens/widgets/productRow.dart';
import 'package:flutter_application_1/screens/widgets/sectionTitle.dart';
import 'package:flutter_application_1/screens/widgets/shopDepartment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> list1= List.from(Product.products.where((product) => product.isRecommended));
   List<Product> list2= List.from(Product.products.where((product) => product.isPopular));
  List<Product> display_list = List.from(Product.products);
  void updateList(String value) {
    setState(() {
      display_list = Product.products
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 50,
              width: 320,
              child: TextField(
                onChanged: (value) => updateList(value),
                autocorrect: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 234, 236, 240),
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
        title: const Center(child: Text("Student Fest")),
      ),
      drawer: Drawer(
        width: 200,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('assests/images/StudentFest.png')),
              ),
              ExpansionTile(
                expandedAlignment: Alignment.topLeft,
                title: const Text('Ask My Peers'),
                initiallyExpanded: false,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routemanger.sixthPage);
                      },
                      child: const Text("Chatboard"),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routemanger.sixthPage);
                    },
                    child: const Text("Event"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: Row(
                  children: [
                    const Text(
                      "Student Fest",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.home))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Text(
                      "Services",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 65,
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.room_service)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Text(
                      "Orders",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 75,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_cart)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Text(
                      "Reports",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Routemanger.reportPage);
                        },
                        icon: const Icon(Icons.report)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Text(
                      "Log out",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    IconButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                        },
                        icon: const Icon(Icons.exit_to_app)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shop by Department',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 3,
                color: Colors.black,
              ),
              SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: Category.categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ShopDep(
                        categories: Category.categories[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlay: true,
              ),
              items: Category.categories
                  .map((category) => CarouselCat(
                        category: category,
                        product: null,
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            child: Container(
              height: 500,
              child: display_list.isEmpty
                  ? const Center(
                      child: Text(
                        "Oops Not Found ",
                        style: TextStyle(color: Colors.grey,
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    )
                  : 
                  SingleChildScrollView(
                    child: Column(
                        children: [
                           const SectionTitle(title: "All Product"),
                          const SizedBox(
                            height: 15,
                          ),
                          ProductRow(
                            products: display_list
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const SectionTitle(title: "Recommended"),
                          const SizedBox(
                            height: 15,
                          ),
                          ProductRow(
                            products: Product.products.where((product) => product.isRecommended).toList()
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const SectionTitle(title: "Most Popular"),
                          const SizedBox(
                            height: 15,
                          ),
                          ProductRow(
                            products:Product.products.where((product) => product.isPopular).toList()
                          ),
                        ],
                      ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

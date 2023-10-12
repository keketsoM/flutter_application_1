import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/category_model.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/screens/widgets/bottomNavBar.dart';
import 'package:flutter_application_1/screens/widgets/carouselHome.dart';
import 'package:flutter_application_1/screens/widgets/drawer.dart';
import 'package:flutter_application_1/screens/widgets/productRow.dart';
import 'package:flutter_application_1/screens/widgets/sectionTitle.dart';
import 'package:flutter_application_1/screens/widgets/shopDepartment.dart';
import 'package:flutter_application_1/screens/widgets/customAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
              ),
              Row(
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
              Divider(
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
          SizedBox(
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
          const SectionTitle(title: "Recommended"),
          ProductRow(
            products: Product.products
                .where((product) => product.isRecommended)
                .toList(),
          ),
          const SectionTitle(title: "Most Popular"),
          ProductRow(
            products:
                Product.products.where((product) => product.isPopular).toList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

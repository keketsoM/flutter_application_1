import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/models.dart';
import 'package:flutter_application_1/screens/widgets/common_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ApiProductBloc>().add(ApiProductFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: DrawerBar(),
      backgroundColor: Colors.white,
      body: BlocBuilder<ApiProductBloc, ApiProductState>(
        builder: (context, state) {
          if (state is ProductApiLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductApiFetchingSuccessfulState) {
            return ListView(
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
                  products: state.products
                      .where((products) => products.isRecommmened)
                      .toList(),
                ),
                const SectionTitle(title: "Most Popular"),
                ProductRow(
                  products: state.products
                      .where((products) => products.isPopular)
                      .toList(),
                ),
              ],
            );
          } else {
            return Text("Something went wrong");
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

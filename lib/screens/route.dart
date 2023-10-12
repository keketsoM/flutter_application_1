import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/category_model.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/screens/ProductDetailScreen.dart';
import 'package:flutter_application_1/screens/cartScreen.dart';
import 'package:flutter_application_1/screens/chat_events.dart';
import 'package:flutter_application_1/screens/checkoutScreen.dart';
import 'package:flutter_application_1/screens/homePage.dart';
import 'package:flutter_application_1/screens/productGridScreen.dart';
import 'package:flutter_application_1/screens/report.dart';
import 'package:flutter_application_1/screens/wishListScreen.dart';
import 'package:flutter_application_1/searchScreen.dart';

class Routemanger {
  static const String homePage = '/';
  static const String secondPage = '/secondpage';
  static const String thirdPage = '/thirdpage';
  static const String fourthPage = '/fourthpage';
  static const String fivePage = '/fivepage';
  static const String sixthPage = '/sixthpage';
  static const String eightPage = '/eightpage';
  static const String reportPage = '/sevenpage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case secondPage:
        return MaterialPageRoute(
          builder: (context) =>
              CategoryScreen(categories: settings.arguments as Category),
        );
      case thirdPage:
        return MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
            products: settings.arguments as Product,
          ),
        );
      case fourthPage:
        return MaterialPageRoute(
          builder: (context) => const WishListScreen(),
        );

      case fivePage:
        return MaterialPageRoute(
          builder: (context) => const CartList(),
        );
      case sixthPage:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      // case sevenPage:
      // return MaterialPageRoute(
      //   builder: (context) => const chatScreen(),
      // );
      case eightPage:
        return MaterialPageRoute(
          builder: (context) => CheckoutScreen(),
        );

      case reportPage:
        return MaterialPageRoute(
          builder: (context) => const ReportScreen(),
        );

      default:
        throw const FormatException("page not found");
    }
  }
}

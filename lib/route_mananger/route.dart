import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/category_model.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/model/services.dart';
import 'package:flutter_application_1/screens/CategoryScreen.dart';
import 'package:flutter_application_1/screens/product_details_screen/product_detail_screen.dart';
import 'package:flutter_application_1/screens/api_test.dart';
import 'package:flutter_application_1/screens/cart_screen/cartScreen.dart';
import 'package:flutter_application_1/screens/chat_screen/chat_events.dart';
import 'package:flutter_application_1/screens/checkout_screen/checkoutScreen.dart';
import 'package:flutter_application_1/screens/home_screen/homePage.dart';

import 'package:flutter_application_1/screens/reports_screen/report.dart';
import 'package:flutter_application_1/screens/service_screen/services.dart';
import 'package:flutter_application_1/screens/wish_list_screen/wishListScreen.dart';
import 'package:flutter_application_1/screens/search_screen/searchScreen.dart';
import 'package:flutter_application_1/services_detail.dart';

class Routemanger {
  static const String homePage = '/';
  static const String secondPage = '/secondpage';
  static const String thirdPage = '/thirdpage';
  static const String fourthPage = '/fourthpage';
  static const String fivePage = '/fivepage';
  static const String sixthPage = '/sixthpage';
  static const String eightPage = '/eightpage';
  static const String reportPage = '/sevenpage';
  static const String chatScreen = '/chatScreen';
  static const String seviceScreen = '/seviceScreen';
  static const String apiPage = "/api";

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
      case chatScreen:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
        );
      case eightPage:
        return MaterialPageRoute(
          builder: (context) => CheckoutScreen(),
        );
      case seviceScreen:
        return MaterialPageRoute(
          builder: (context) =>
              ServiceDetailScreen(service: settings.arguments as Services),
        );

      case reportPage:
        return MaterialPageRoute(
          builder: (context) => const ReportScreen(),
        );

      case apiPage:
        return MaterialPageRoute(
          builder: (context) => const TestApi(),
        );

      default:
        throw const FormatException("page not found");
    }
  }
}

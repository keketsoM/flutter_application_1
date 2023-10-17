import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model/product.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  double get subtotal =>
      products.fold(0, (total, current) => total + current.productPrice);

  double deliveryFee(subtotal) {
    if (subtotal <= 1) {
      return subtotal;
    } else {
      return 1;
    }
  }

  String freeDelivery(subtotal) {
    // if (subtotal == 0.0) {
    //   return "You have free delivery";
    // }
    // else {
    //   double missing = 1000.00 - subtotal;
    //   return "Add R${missing.toStringAsFixed(2)} iteams for free delivery";
    // }
    String name = '';
    if (subtotal == 0) {
      name = "Start Shopping";
    }
    return name;
  }

  double total(subtotal, deliveryFee) {
    return subtotal;
  }

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freedeliveryString => freeDelivery(subtotal);
  String get subtotalString => subtotal.toStringAsFixed(2);
  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);
  @override
  // TODO: implement props
  List<Object?> get props => [products];
}

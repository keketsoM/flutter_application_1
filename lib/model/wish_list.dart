import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model/product.dart';

class WishList extends Equatable {
  final List<Product> products;
  const WishList({this.products = const <Product>[]});

  @override

  // TODO: implement props
  List<Object?> get props => [products];
}

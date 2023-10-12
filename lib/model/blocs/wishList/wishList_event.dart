import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model/product.dart';

abstract class wishListEvent extends Equatable {
  const wishListEvent();
  @override
  List<Object> get props => [];
}

class StartWishList extends wishListEvent {}

class AddWishListProduct extends wishListEvent {
  final Product product;

  const AddWishListProduct(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveWishListProduct extends wishListEvent {
  final Product product;

  const RemoveWishListProduct(this.product);

  @override
  List<Object> get props => [product];
}

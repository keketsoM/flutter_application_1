part of 'api_bloc.dart';

sealed class ApiProductState extends Equatable {
  const ApiProductState();

  @override
  List<Object> get props => [];
}

final class ProductApiInitial extends ApiProductState {}

final class ProductApiFetchingSuccessful extends ApiProductState {
  final List<Product> products;
  const ProductApiFetchingSuccessful({required this.products});

  @override
  List<Object> get props => [];

  // final WishList wishList;

  // const WishListLoaded({this.wishList = const WishList()});
  // @override
  // List<Object> get props => [wishList];
}

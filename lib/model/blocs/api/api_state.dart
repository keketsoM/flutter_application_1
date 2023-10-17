part of 'api_bloc.dart';

abstract class ApiProductState extends Equatable {
  const ApiProductState();

  @override
  List<Object> get props => [];
}

class ProductApiInitialState extends ApiProductState {}

class ProductApiLoadingState extends ApiProductState {}

class ProductApiFetchingSuccessfulState extends ApiProductState {
  final List<Product> products;
  const ProductApiFetchingSuccessfulState({
    required this.products,
  });
  @override
  List<Object> get props => [products];
}

class ProductApiErrorState extends ApiProductState {
  @override
  List<Object> get props => [];
}

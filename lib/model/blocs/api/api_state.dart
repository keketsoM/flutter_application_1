part of 'api_bloc.dart';

abstract class ApiProductState extends Equatable {
  const ApiProductState();

  @override
  List<Object> get props => [];
}

class ProductApiLoadingState extends ApiProductState {}

class ProductApiFetchingSuccessfulState extends ApiProductState {
  final List<Product> products;
  final List<Services> services;
  final List<Events> events;
  const ProductApiFetchingSuccessfulState(
      {required this.products, required this.services, required this.events});
  @override
  List<Object> get props => [products, services, events];
}

class ProductApiErrorState extends ApiProductState {
  final Error error;
  const ProductApiErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

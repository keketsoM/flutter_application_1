part of 'api_bloc.dart';

abstract class ApiProductEvent extends Equatable {
  const ApiProductEvent();

  @override
  List<Object> get props => [];
}

class ApiProductStart extends ApiProductEvent {
  @override
  List<Object> get props => [];
}

class ApiProductFetch extends ApiProductEvent {
  @override
  List<Object> get props => [];
}

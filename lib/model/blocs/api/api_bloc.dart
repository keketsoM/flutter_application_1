import 'dart:async';

import 'package:flutter_application_1/model/services/services.dart';
import 'package:flutter_application_1/model/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'api_event.dart';
part 'api_state.dart';

class ApiProductBloc extends Bloc<ApiProductEvent, ApiProductState> {
  ApiProductBloc() : super(ProductApiInitialState()) {
    on<ApiProductStart>(_onApiProductStart);
    on<ApiProductFetch>(_onApiProductFetch);
  }
}

FutureOr<void> _onApiProductStart(event, Emitter<ApiProductState> emit) async {
  emit(ProductApiInitialState());
  try {
    await Future<void>.delayed(const Duration(seconds: 2));
    emit(ProductApiFetchingSuccessfulState(products: []));
  } catch (_) {}
}

FutureOr<void> _onApiProductFetch(event, Emitter<ApiProductState> emit) async {
  emit(ProductApiFetchingSuccessfulState(products: []));
  List<Product> products = await ProductsAPI.fetchData();
  emit(ProductApiFetchingSuccessfulState(products: products));
}

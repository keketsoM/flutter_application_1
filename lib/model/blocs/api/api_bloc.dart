import 'dart:async';

import 'package:flutter_application_1/model/services/services.dart';
import 'package:flutter_application_1/model/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'api_event.dart';
part 'api_state.dart';

class ApiProductBloc extends Bloc<ApiProductEvent, ApiProductState> {
  ApiProductBloc() : super(ProductApiLoadingState()) {
    on<ApiProductFetch>(_onApiProductFetch);
  }
}

FutureOr<void> _onApiProductFetch(event, Emitter<ApiProductState> emit) async {
  try {
    List<Product> products = await ProductsAPI.fetchData();
    print("_onApiProductFetch Debug: Length of Products = ${products.length}");
    emit(ProductApiFetchingSuccessfulState(products: products));
  } catch (e) {
    emit(ProductApiErrorState(error: e as Error));
  }
}

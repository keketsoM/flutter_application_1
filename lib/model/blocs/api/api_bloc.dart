import 'dart:async';

import 'package:flutter_application_1/model/services/services.dart';
import 'package:flutter_application_1/model/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'api_event.dart';
part 'api_state.dart';

class ApiProductBloc extends Bloc<ApiProductEvent, ApiProductState> {
  ApiProductBloc() : super(ProductApiInitial()) {
    on<ApiProductStarted>(_onApiProductStarted);
  }
}

FutureOr<void> _onApiProductStarted(event, Emitter<ApiProductState> emit) async {
      var products = await ProductsAPI.getProducts();
      emit(ProductApiFetchingSuccessful(products: products));
}

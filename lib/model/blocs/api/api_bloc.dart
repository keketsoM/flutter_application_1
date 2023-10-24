import 'dart:async';

import 'package:flutter_application_1/model/events.dart';
import 'package:flutter_application_1/model/services.dart';

import 'package:flutter_application_1/model/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model/services/events_api.dart';
import 'package:flutter_application_1/model/services/products_api.dart';
import 'package:flutter_application_1/model/services/services_api.dart';

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
    List<Services> service = await ServicesAPI.fetchData();
    print("_onApiProductFetch Debug: Length of Services = ${service.length}");
    List<Events> event = await EventAPI.fetchData();
    print("_onApiProductFetch Debug: Length of Services = ${event.length}");
    emit(ProductApiFetchingSuccessfulState(
      products: products,
      services: service,
      events: event,
    ));
  } catch (e) {
    print("Error in the block api");
    emit(ProductApiErrorState(error: e as Error));
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_1/model/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'api_event.dart';
part 'api_state.dart';

class ApiProductBloc extends Bloc<ApiProductEvent, ApiProductState> {
  ApiProductBloc() : super(ProductApiInitial()) {
    on<ApiProductStarted>(_onApiProductStarted);
  }
}

FutureOr<void> _onApiProductStarted(
    event, Emitter<ApiProductState> emit) async {
  // Trust all certificates for development and testing purposes
  final client = HttpClient()
    ..badCertificateCallback = (cert, host, port) => true;
  List<Product> productsApi = [];

  try {
    var url = Uri.https("10.0.2.2:7006", "/api/ProductApiController/");
    var request = await client.getUrl(url);
    var response = await request.close();

    if (response.statusCode == 200) {
      var responseBody = await response.transform(utf8.decoder).join();
      var jsonResponse = convert.jsonDecode(responseBody);
      for (int i = 0; i < jsonResponse.length; i++) {
        Product product =
            Product.fromJson(jsonResponse[i] as Map<String, dynamic>);
        productsApi.add(product);
      }
      print("hello $productsApi");
      emit(ProductApiFetchingSuccessful(products: productsApi));
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print('Error: $e');
  } finally {
    client.close();
  }
}

import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_1/model/models.dart';

class ProductsAPI {
  static final client = HttpClient();

  static Future<List<Product>> getProducts() async {
    var url = Uri.https("10.0.2.2:7006", "/api/ProductApiController/");
    var request = await client.getUrl(url);
    var response = await request.close();

    if (response.statusCode == 200) {
      var responseBody = await response.transform(utf8.decoder).join();
      var jsonResponse = convert.jsonDecode(responseBody);
      print("Successfully fetched products from API");

      return jsonResponse.map((prod) => Product.fromJson(prod as Map<String, dynamic>)).toList();
      // for (int i = 0; i < jsonResponse.length; i++) {
      //   var product = Product.fromJson(jsonResponse[i] as Map<String, dynamic>);
      //   productsApi.add(product);
      // }
    }
    // TODO: Handle errors better
    print('Request failed with status: ${response.statusCode}.');
    return [];
  }
}
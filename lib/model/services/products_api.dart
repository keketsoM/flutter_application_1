import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_1/model/models.dart';

class ProductsAPI {
  final client = HttpClient();
  // emit(ProductApiLoadingState());
  static Future<List<Product>> fetchData() async {
    List jsonResponse;
    // Trust all certificates for development and testing purposes
    final client = HttpClient()
      ..badCertificateCallback = (cert, host, port) => true;
    try {
      var url = Uri.https("10.0.2.2:7006", "/studentFest/products");
      var request = await client.getUrl(url);
      var response = await request.close();

      if (response.statusCode == 200) {
        var responseBody = await response.transform(utf8.decoder).join();
        print(responseBody);
        jsonResponse = convert.jsonDecode(responseBody);
        print("Successfully fetched products from API");

        return jsonResponse.map((prod) => Product.fromJson(prod)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}

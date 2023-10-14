import 'dart:convert' as convert;
import 'dart:convert';
import 'package:flutter_application_1/model/product.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ProductRepo {
  List<dynamic> productsapi = [];

  static Future<void> getProducts() async {
    // Trust all certificates for development and testing purposes
    final client = HttpClient()
      ..badCertificateCallback = (cert, host, port) => true;

    try {
      var url = Uri.https("10.0.2.2:7006", "/api/ProductApiController/");
      var request = await client.getUrl(url);
      var response = await request.close();

      if (response.statusCode == 200) {
        var responseBody = await response.transform(utf8.decoder).join();
        var jsonResponse = convert.jsonDecode(responseBody);
        print(jsonResponse);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      client.close();
    }
  }
}

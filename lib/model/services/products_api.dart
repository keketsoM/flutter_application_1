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
    List<Product> products = [];
    try {
      var url = Uri.https("10.0.2.2:7006", "/api/ProductApiController/");
      var request = await client.getUrl(url);
      var response = await request.close();

      if (response.statusCode == 200) {
        var responseBody = await response.transform(utf8.decoder).join();
        jsonResponse = convert.jsonDecode(responseBody);

        for (int i = 0; i < jsonResponse.length; i++) {
          Product product =
              Product.fromJson(jsonResponse[i] as Map<String, dynamic>);
          products.add(product);
        }
        print(products);
        return products;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      //emit(ProductApiErrorState);
      ('Error: $e');
      return [];
    } finally {
      client.close();
    }
    return products;
  }
}

  // static final client = HttpClient();
  // List<dynamic> products = [];
  // // emit(ProductApiLoadingState());
  // static Future<void> getProducts() async {
  //   List? jsonResponse;
  //   // Trust all certificates for development and testing purposes
  //   final client = HttpClient()
  //     ..badCertificateCallback = (cert, host, port) => true;
  //   List<Product> products = [];

  //   try {
  //     var url = Uri.https("10.0.2.2:7006", "/api/ProductApiController/");
  //     var request = await client.getUrl(url);
  //     var response = await request.close();

  //     if (response.statusCode == 200) {
  //       var responseBody = await response.transform(utf8.decoder).join();
  //       jsonResponse = convert.jsonDecode(responseBody);

  //       for (int i = 0; i < jsonResponse!.length; i++) {
  //         Product product =
  //             Product.fromJson(jsonResponse[i] as Map<String, dynamic>);
  //         products.add(product);
  //         print(products);
  //       }
  //     } else {
  //       print('Request failed with status: ${response.statusCode}.');
  //     }
  //   } catch (e) {
  //     //emit(ProductApiErrorState);
  //     print('Error: $e');
  //   } finally {
  //     client.close();
  //   }
  // }
//}





    




 // static Future<List<Product>> getProducts() async {
  //   var url = Uri.https("10.0.2.2:7006", "/api/ProductApiController/");
  //   var request = await client.getUrl(url);
  //   var response = await request.close();

  //   if (response.statusCode == 200) {
  //     var responseBody = await response.transform(utf8.decoder).join();
  //     var jsonResponse = convert.jsonDecode(responseBody);
  //     print("Successfully fetched products from API");

  //     return jsonResponse.map((prod) => Product.fromJson(prod as Map<String, dynamic>)).toList();
  //     // for (int i = 0; i < jsonResponse.length; i++) {
  //     //   var product = Product.fromJson(jsonResponse[i] as Map<String, dynamic>);
  //     //   productsApi.add(product);
  //     // }
  //   }
  //   // TODO: Handle errors better
  //   print('Request failed with status: ${response.statusCode}.');
  //   return [];
 // }
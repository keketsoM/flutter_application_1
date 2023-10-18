import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_application_1/model/models.dart';
import 'package:flutter_application_1/model/services.dart';

class ServicesAPI {
  final client = HttpClient();
  // emit(ProductApiLoadingState());
  static Future<List<Services>> fetchData() async {
    List jsonResponse;
    // Trust all certificates for development and testing purposes
    final client = HttpClient()
      ..badCertificateCallback = (cert, host, port) => true;
    try {
      var url =
          Uri.https("10.0.2.2:7006", "/api/ProductApiController/GetServices");
      var request = await client.getUrl(url);
      var response = await request.close();

      if (response.statusCode == 200) {
        var responseBody = await response.transform(utf8.decoder).join();
        print(responseBody);
        jsonResponse = convert.jsonDecode(responseBody);
        print("Successfully fetched services from API");
        print(jsonResponse);
        print("Successfully fetched service from API");
        return jsonResponse
            .map((service) => Services.fromJson(service))
            .toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}

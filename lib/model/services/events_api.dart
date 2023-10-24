import 'dart:convert' as convert;
import 'dart:convert';

import 'dart:io';
import 'package:flutter_application_1/model/events.dart';

class EventAPI {
  final client = HttpClient();
  // emit(ProductApiLoadingState());
  static Future<List<Events>> fetchData() async {
    List jsonResponse;
    // Trust all certificates for development and testing purposes
    final client = HttpClient()
      ..badCertificateCallback = (cert, host, port) => true;
    try {
      var url = Uri.https("10.0.2.2:7006", "/studentFest/events");
      var request = await client.getUrl(url);
      var response = await request.close();

      if (response.statusCode == 200) {
        var responseBody = await response.transform(utf8.decoder).join();
        print(responseBody);
        jsonResponse = convert.jsonDecode(responseBody);
        print("Successfully fetched events from API");
        print(jsonResponse);
        print("Successfully fetched events from API");
        return jsonResponse.map((events) => Events.fromJson(events)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}

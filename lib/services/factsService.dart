import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvc_flutter/models/factsResponse.dart';

class FactsService {
  Future<FactsResponse> getFacts() async {
    http.Response response;

    response = await http
        .get(Uri.parse('https://thegrowingdeveloper.org/apiview?id=2'));

    if (response.statusCode == 200) {
      FactsResponse factsResponse =
          FactsResponse.fromJson(json.decode(response.body));
      return factsResponse;
    } else {
      return null;
    }
  }
}

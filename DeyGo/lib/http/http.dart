// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HTTP {
  final client = http.Client();
  final baseURL = 'deygo.hasura.app';
  final Map<String, String> appHeaders = Map.from({
    'x-hasura-admin-secret':
        'SHKXHp6TDTmEGjWsZGn4wB4CeSA1cpRiMBVIBi1Hp9AVTgxaDzwszSMDPBcElmHu',
    HttpHeaders.contentTypeHeader: 'application/json',
    'Accept': "application/json",
  });

  void dispose() {
    client.close();
  }

  Future<dynamic> Post(String route, dynamic body) async {
    try {
      var response = await client.post(
        Uri.https(baseURL, "api/rest/$route"),
        body: jsonEncode(body),
        headers: appHeaders,
      );
      final decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      print('');
      print('Api Response (POST):');
      print(decodedResponse);
      print('');
      return decodedResponse;
    } finally {}
  }

  Future<dynamic> Get(String route) async {
    try {
      var response = await client.get(
        Uri.https(baseURL, "api/rest/$route"),
        headers: appHeaders,
      );
      final decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      print('');
      print('Api Response (GET):');
      print(decodedResponse);
      print('');
      return decodedResponse;
    } finally {}
  }
}

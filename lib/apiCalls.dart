import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future getData() async {
  var request = http.Request(
      'GET', Uri.parse('https://jsonplaceholder.typicode.com/users'));

  http.StreamedResponse response = await request.send();
  var res = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(res);
  } else {
    print(response.reasonPhrase);
  }
  return res;
}

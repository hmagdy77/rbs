import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

class Crud {
  static getRequest(String url) async {
    var response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var body = jsonDecode(response.body);
        return body;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Catched Error $e***************');
      }
    }
  }

  static postRequest({
    required String url,
    required Map data,
    required Function function,
  }) async {
    var response = await http.post(Uri.parse(url), body: data);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonData = response.body;
        return function(jsonData);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Catched Error $e***************');
      }
    }
  }

  static postRequestWithFile({
    required String url,
    required Map data,
    List<int>? selectedFile,
    required Function function,
    required String imageName,
    required String requestName,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(http.MultipartFile.fromBytes(requestName, selectedFile!,
        contentType: MediaType('application', 'json'), filename: imageName));
    data.forEach(
      (key, value) {
        request.fields[key] = value;
      },
    );
    var sendRequset = await request.send();
    var response = await http.Response.fromStream(sendRequset);
    try {
      if (sendRequset.statusCode == 200 || sendRequset.statusCode == 201) {
        var jsonData = response.body;
        return function(jsonData);
      }
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }
}

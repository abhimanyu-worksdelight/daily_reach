import 'dart:io';
import 'dart:typed_data';

import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/io_client.dart';


class NetworkUtil {
  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();


  Future<dynamic> get(String url, ApiInterface interface) {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    var uri = Uri.parse(Constants.baseUrl + url);
    return http.get(uri, headers: {
      'Accept': 'application/json',

    }).then((response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode == 401) {
        interface.onTokenExpire(res, statusCode);
        return _decoder.convert(res);
      }
      if (statusCode < 200 || statusCode > 400 || json == null) {
        interface.onFailure("", statusCode);
        throw new Exception('Error while fetching data');
      }
      if (statusCode == 200) {
        interface.onSuccess(_decoder.convert(res), statusCode);
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> getAuth(String url,String token, ApiInterface interface) {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    var uri = Uri.parse(Constants.baseUrl + url);
    print('url--------$uri');
    return http.get(uri, headers: {
      // 'Accept': 'application/json',
      'Authorization': 'Token $token',
      'Accept':'application/json'
    },).then((response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode == 401) {
        interface.onTokenExpire(res, statusCode);
        return _decoder.convert(res);
      }
      if (statusCode < 200 || statusCode > 400 || json == null) {
        interface.onFailure("", statusCode);
        throw new Exception('Error while fetching data');
      }
      if (statusCode == 200) {
        interface.onSuccess(_decoder.convert(res), statusCode);
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> postHeaderAuth(
      String url, String token, ApiInterface interface,
      {body}) async {
    print('Post $url  body: $body $token');
    var uri = Uri.parse(Constants.baseUrl + url);
    print('uri $uri');
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final httpObj = new IOClient(ioc);
    return await httpObj.post(uri, body: body, headers: {
//      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'X-Requested-With': 'XMLHttpRequest',
      'Authorization': 'Token $token'
    }).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode == 401) {
        interface.onTokenExpire(res, statusCode);
        return _decoder.convert(res);
      }
      if (statusCode == 200 || statusCode == 201) {
        interface.onSuccess(_decoder.convert(res), statusCode);
      }
      if (statusCode < 200 || statusCode > 400 || json == null) {
        interface.onFailure("", statusCode);
        throw new Exception('Error while fetching data');
      }

      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, ApiInterface interface, {body}) async {
//    var newUrl = url+"/";
    print('Post ${Constants.baseUrl + url}  body: $body');
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final httpObj = new IOClient(ioc);
    var uri = Uri.parse(Constants.baseUrl + url);
    httpObj.post(uri, body: body).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      print('res $res');

      if (statusCode == 401) {
        interface.onTokenExpire(res, statusCode);
        return _decoder.convert(res);
      }
      if (statusCode < 200 || statusCode > 400 || json == null) {
        interface.onFailure("", statusCode);
        throw new Exception('Error while fetching data');
      }
      if (statusCode == 200 || statusCode == 201) {
        interface.onSuccess(_decoder.convert(res), statusCode);
      }
//      return _decoder.convert(res);
    });
  }

  Future<dynamic> uploadMultipartImage(
    String url,
    ApiInterface apiInterface,
    String authKey,
    String firstName,
    String email,
    String phone,
    String imagePath,
  ) async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final httpObj = new IOClient(ioc);

    var uri = Uri.parse(Constants.baseUrl + url);
    print('url ${Constants.baseUrl + url}');
    http.MultipartRequest request = new http.MultipartRequest('POST', uri);

    if (authKey.isNotEmpty) {
      request.headers['Authorization'] = 'Token $authKey';
    }

    request.fields['name'] = firstName;
    request.fields['phone'] = phone;
    request.fields['email'] = email;

    print('imagePath $imagePath');

    if (imagePath.isNotEmpty) {
      request.files
          .add(await http.MultipartFile.fromPath('photo', imagePath));
    }

    http.Response response =
        await http.Response.fromStream(await request.send());
    print('response  ${response.statusCode} => ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      apiInterface.onSuccess(
          _decoder.convert(response.body), response.statusCode);
    } else {
      apiInterface.onFailure("", response.statusCode);
    }
    return _decoder.convert(response.body);
  }

}
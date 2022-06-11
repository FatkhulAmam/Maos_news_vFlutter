import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:maos_news_flutter/core/env.dart';
import 'package:maos_news_flutter/utility/log/dio_logger.dart';
import 'package:maos_news_flutter/utility/shared/constant/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIProvider {
  static const String TAG = 'APIProvider';
  static final String _baseUrl = Env.value.baseUrl;

  late bool isConnected = false;
  late Dio _dio;
  var tokenDio = Dio();
  late BaseOptions dioOptions;
  var storage = Get.find<SharedPreferences>();

  APIProvider() {
    dioOptions = BaseOptions()..baseUrl = APIProvider._baseUrl;
    dioOptions.validateStatus = (value) {
      return value! < 500;
    };

    _dio = Dio(dioOptions);
    tokenDio.options = _dio.options;

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      DioLogger.onSend(TAG, options);
      await checkConnectivity();
      return handler.next(options);
    }, onResponse: (response, handler) {
      DioLogger.onSuccess(TAG, response);
      return handler.next(response);
    }, onError: (DioError dioError, handler) {
      DioLogger.onError(TAG, dioError);

      throwIfNoSuccess(dioError);
      return handler.next(dioError);
    }));

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
  }

  Future<Response> postData(String path, dynamic data) async {
    try {
      var response = await _dio.post(path, data: data);
      return response;
    } on DioError catch (ex) {
      throw Exception(json.decode(ex.response.toString())["error"]);
    }
  }


  Future<Response> postToken(String path, dynamic data) async {
    try {
      await addAuthorOpt();
      var response = await _dio.post(path, data: data);
      return response;
    } on DioError catch (ex) {
      throw Exception(json.decode(ex.response.toString())["error"]);
    }
  }

  Future<Response> putData(String path, dynamic data) async {
    try {
      await addAuthorOpt();
      var response = await _dio.put(path, data: data);
      return response;
    } on DioError catch (ex) {
      throw  Exception(json.decode(ex.response.toString())["error"]);
    }
  }

  Future<Response> getData(String path) async {
    try {
      await addAuthorOpt();
      var response = await _dio.get(path);
      return response;
    } on DioError catch (ex) {
      throw  Exception(json.decode(ex.response.toString())["error"]);
    }
  }

  Future<Response> deleteData(String path) async {
    try {
      var response = await _dio.delete(path);
      return response;
    } on DioError catch (ex) {
      throw  Exception(json.decode(ex.response.toString())["error"]);
    }
  }

  Future<BaseOptions> addAuthorOpt() async {
    dioOptions.headers = {
      'X-Auth-token': '${storage.getString(StorageConstants.token)}',
      'X-User-token': '${storage.getString(StorageConstants.token)}',
      'X-User-id': '${storage.getString(StorageConstants.userId)}',
    };

    Get.log('header : ${dioOptions.headers}');
    return dioOptions;
  }

  void throwIfNoSuccess(DioError ex) async {
    if (ex.response!.statusCode! < 200 || ex.response!.statusCode! > 299) {
      Get.log("Gagal Oy");
      String errorMessage = json.decode(ex.response.toString())["error"] ??
          json.decode(ex.response.toString())["message"];
      Get.snackbar(
        'Oops..',
        errorMessage,
        backgroundColor: const Color(0xFF3F4E61),
      );
      throw Exception(errorMessage);
    }
  }

  checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Get.back();
      isConnected = false;
      noInternetWarning();
    } else {
      isConnected = true;
    }
  }

  noInternetWarning() async {
    await Get.defaultDialog(
      title: "No Internet",
      titlePadding: const EdgeInsets.all(20),
      titleStyle: const TextStyle(fontSize: 14),
      contentPadding: const EdgeInsets.only(bottom: 20, left: 14, right: 14),
      middleText: "Please check your connectivity!",
      middleTextStyle: const TextStyle(
        fontSize: 10,
      ),
      confirm: ElevatedButton(
        onPressed: () => Get.back(),
        child: const Text("Try Again"),
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          onPrimary: Colors.white,
          shadowColor: Colors.transparent,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12.44,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      cancel: ElevatedButton(
        onPressed: () => Get.back(),
        child: const Text("Close"),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          onPrimary: Colors.white,
          shadowColor: Colors.transparent,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12.44,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

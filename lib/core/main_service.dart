import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hizli_su/core/services/app_interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MainService {
  Dio dio;
  final box = GetStorage();
  MainService() {
   // var baseUrl = 'http://192.168.1.117:21021/api';
    var baseUrl = 'http://213.238.181.210:9090/api';
    var headers = {
      'Authorization': 'Bearer ${box.read('accessToken')}',
    };

    dio = Dio(BaseOptions(baseUrl: baseUrl, headers: headers));
    // dio.interceptors.add(PrettyDioLogger(
    //     requestHeader: false,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: false,
    //     error: true,
    //     compact: false,
    //     maxWidth: 90));

    // otomatik durum yakalayıcı
    dio.interceptors.add(AppInterceptors());
  }


  Future<Response> get(String path) async {
    try {
      return await dio.get(path);
    } on DioError {
      rethrow;
    }
  }

  Future<Response> getWithQueryParams(String path,
      {Map<String, dynamic> queryParameters}) async {
    try {
      return await dio.get(path, queryParameters: queryParameters);
    } on DioError {
      rethrow;
    }
  }

  Future<Response> post(String path, {@required dynamic data}) async {
    try {
      return await dio.post(path, data: data);
    } on DioError catch (e) {
      // throw e.response;
      // return e.response;
      rethrow;
   }
  }

  Future<Response> delete(String path) async {
    try {
      return await dio.delete(path);
    } on DioError {
      rethrow;
    }
  }

  Future<Response> put(String path, {@required dynamic data}) async {
    try {
      return await dio.put(path, data: data);
    } on DioError {
      rethrow;
    }
  }
}

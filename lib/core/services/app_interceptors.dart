import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hizli_su/core/binding.dart';
import 'package:hizli_su/models/auth/user_token.dart';
import 'package:hizli_su/pages/auth/login_page.dart';
import '../routes.dart';

class AppInterceptors extends Interceptor {
  final box = GetStorage();

  @override
  Future<dynamic> onError(DioError dioError, ErrorInterceptorHandler handler) async {

    if (dioError.response.statusCode == 401) {
      box.erase();
      Get.snackbar("Hata", 'Oturum süreniz sona erdi. Lütfen tekrar oturum açınız',
          backgroundColor: Colors.orange,
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.only(bottom: 10),
          colorText: Colors.white);
      Timer(Duration(seconds: 3), () => Get.offAll(() => LoginPage(), binding: Binding(), ));

    }else {
   //   print(dioError.response.data);
      var userToken = UserToken.fromJson(dioError.response.data);

      Get.snackbar(userToken.error.message??'', userToken.error.details??'',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(5),
          duration: Duration(seconds: 5),
          colorText: Colors.white);
    }
    return dioError;
  }


}
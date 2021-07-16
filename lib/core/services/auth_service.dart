import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:hizli_su/core/main_service.dart';
import 'package:hizli_su/models/auth/user_token.dart';

class AuthService {

  Future<UserToken> signIn({ @required String emailAddress, @required String password}) async {
    Map<String, dynamic> requestBody = {
      "userNameOrEmailAddress": emailAddress,
      "password": password,
      "rememberClient": true
    };
    Response resp = await MainService().post(
        '/TokenAuth/Authenticate', data: requestBody);
    return UserToken.fromJson(resp.data);
  }

}
import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:hizli_su/core/main_service.dart';
import 'package:hizli_su/models/auth/password_change_result.dart';
import 'package:hizli_su/models/auth/register_result.dart';
import 'package:hizli_su/models/auth/user_detail_result.dart';
import 'package:hizli_su/models/auth/user_model.dart';
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

  Future<UserDetailResult> getAuthUserInfo() async {
    Response resp =
    await MainService().get('/services/app/Account/GetAuthUserInfo');
    return UserDetailResult.fromJson(resp.data);
  }

  Future<UserDetailResult> updateUser(User user) async {
    Response resp = await MainService().put('/services/app/Account/UpdateUser',data: user.toJson());
    return UserDetailResult.fromJson(resp.data);
  }

  Future<RegisterResult> saveUser(User user) async {
    Response resp = await MainService().post('/services/app/Account/Register',data: user.toJson());
    return RegisterResult.fromJson(resp.data);
  }

  Future<PasswordChangeResult> changePassword(String password, String newPassword) async {
    Map<String, dynamic> requestBody = {
      "currentPassword": password,
      "newPassword": newPassword
    };
    Response resp = await MainService().post('/services/app/Account/ChangePassword',data: requestBody);
    return PasswordChangeResult.fromJson(resp.data);
  }

}
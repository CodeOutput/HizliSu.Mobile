import 'package:hizli_su/models/address/user_address.dart';

class SaveUserAddressResult {
  UserAddress result;
  bool success;
  Error error;
  bool unAuthorizedRequest;
  bool bAbp;

  SaveUserAddressResult(
      {this.result,
        this.success,
        this.error,
        this.unAuthorizedRequest,
        this.bAbp});

  SaveUserAddressResult.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new UserAddress.fromJson(json['result']) : null;
    success = json['success'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['success'] = this.success;
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    data['unAuthorizedRequest'] = this.unAuthorizedRequest;
    data['__abp'] = this.bAbp;
    return data;
  }
}
class Error {
  int code;
  String message;
  String details;
  String validationErrors;

  Error({this.code, this.message, this.details, this.validationErrors});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    details = json['details'];
    validationErrors = json['validationErrors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['details'] = this.details;
    data['validationErrors'] = this.validationErrors;
    return data;
  }
}
class UserToken {
  Result result;
  String targetUrl;
  bool success;
  Error error;
  bool unAuthorizedRequest;
  bool bAbp;

  UserToken(
      {this.result,
        this.targetUrl,
        this.success,
        this.error,
        this.unAuthorizedRequest,
        this.bAbp});

  UserToken.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
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
    data['targetUrl'] = this.targetUrl;
    data['success'] = this.success;
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    data['unAuthorizedRequest'] = this.unAuthorizedRequest;
    data['__abp'] = this.bAbp;
    return data;
  }
}

class Result {
  String accessToken;
  String encryptedAccessToken;
  int expireInSeconds;
  int userId;

  Result(
      {this.accessToken,
        this.encryptedAccessToken,
        this.expireInSeconds,
        this.userId});

  Result.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    encryptedAccessToken = json['encryptedAccessToken'];
    expireInSeconds = json['expireInSeconds'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['encryptedAccessToken'] = this.encryptedAccessToken;
    data['expireInSeconds'] = this.expireInSeconds;
    data['userId'] = this.userId;
    return data;
  }
}

class Error {
  int code;
  String message;
  String details;
  Null validationErrors;

  Error({this.code, this.message, this.details, this.validationErrors});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    details = json['details'];
   // validationErrors = json['validationErrors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['details'] = this.details;
    // data['validationErrors'] = this.validationErrors;
    return data;
  }
}
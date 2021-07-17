class RegisterResult {
  Result result;
  bool success;
  bool unAuthorizedRequest;
  bool bAbp;

  RegisterResult(
      {this.result, this.success, this.unAuthorizedRequest, this.bAbp});

  RegisterResult.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    success = json['success'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['success'] = this.success;
    data['unAuthorizedRequest'] = this.unAuthorizedRequest;
    data['__abp'] = this.bAbp;
    return data;
  }
}

class Result {
  bool canLogin;

  Result({this.canLogin});

  Result.fromJson(Map<String, dynamic> json) {
    canLogin = json['canLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['canLogin'] = this.canLogin;
    return data;
  }
}
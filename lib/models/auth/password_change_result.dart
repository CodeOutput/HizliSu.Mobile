class PasswordChangeResult {
  bool result;
  bool success;
  bool unAuthorizedRequest;
  bool bAbp;

  PasswordChangeResult(
      {this.result, this.success, this.unAuthorizedRequest, this.bAbp});

  PasswordChangeResult.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    success = json['success'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['success'] = this.success;
    data['unAuthorizedRequest'] = this.unAuthorizedRequest;
    data['__abp'] = this.bAbp;
    return data;
  }
}
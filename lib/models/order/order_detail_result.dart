import 'package:hizli_su/models/order/order.dart';

class OrderDetailResult {
  Order result;
  bool success;
  bool unAuthorizedRequest;
  bool bAbp;

  OrderDetailResult(
      {this.result, this.success, this.unAuthorizedRequest, this.bAbp});

  OrderDetailResult.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Order.fromJson(json['result']) : null;
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

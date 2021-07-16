import 'package:hizli_su/models/cart/cart_model.dart';

class CartResult {
  Result result;
  bool success;
  bool unAuthorizedRequest;
  bool bAbp;

  CartResult({this.result, this.success, this.unAuthorizedRequest, this.bAbp});

  CartResult.fromJson(Map<String, dynamic> json) {
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
  List<Cart> items;

  Result({this.items});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<Cart>.empty(growable: true);
      json['items'].forEach((v) {
        items.add(new Cart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

import 'package:hizli_su/models/address/city.dart';

class CityResult {
  Result result;
  bool success;
  bool unAuthorizedRequest;
  bool bAbp;

  CityResult({this.result, this.success, this.unAuthorizedRequest, this.bAbp});

  CityResult.fromJson(Map<String, dynamic> json) {
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
  List<City> items;

  Result({this.items});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<City>.empty(growable: true);
      json['items'].forEach((v) {
        items.add(new City.fromJson(v));
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

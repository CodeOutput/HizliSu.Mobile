import 'package:hizli_su/models/address/city.dart';
import 'package:hizli_su/models/address/neighborhood.dart';

class District {
  String name;
  bool isActive;
  int cityId;
  City city;
  List<Neighborhood> neighborhoods;
  String lastModificationTime;
  int lastModifierUserId;
  String creationTime;
  int creatorUserId;
  int id;

  District(
      {this.name,
        this.isActive,
        this.cityId,
        this.city,
        this.neighborhoods,
        this.lastModificationTime,
        this.lastModifierUserId,
        this.creationTime,
        this.creatorUserId,
        this.id});

  District.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isActive = json['isActive'];
    cityId = json['cityId'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    if (json['neighborhoods'] != null) {
      neighborhoods = new List<Neighborhood>.empty(growable: true);
      json['neighborhoods'].forEach((v) {
        neighborhoods.add(new Neighborhood.fromJson(v));
      });
    }
    lastModificationTime = json['lastModificationTime'];
    lastModifierUserId = json['lastModifierUserId'];
    creationTime = json['creationTime'];
    creatorUserId = json['creatorUserId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['isActive'] = this.isActive;
    data['cityId'] = this.cityId;
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    if (this.neighborhoods != null) {
      data['neighborhoods'] =
          this.neighborhoods.map((v) => v.toJson()).toList();
    }
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}

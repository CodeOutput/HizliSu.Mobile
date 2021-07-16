import 'package:hizli_su/models/address/district.dart';

class Neighborhood {
  String name;
  bool isActive;
  int districtId;
  District district;
  String lastModificationTime;
  int lastModifierUserId;
  String creationTime;
  int creatorUserId;
  int id;

  Neighborhood(
      {this.name,
        this.isActive,
        this.districtId,
        this.district,
        this.lastModificationTime,
        this.lastModifierUserId,
        this.creationTime,
        this.creatorUserId,
        this.id});

  Neighborhood.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isActive = json['isActive'];
    districtId = json['districtId'];
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
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
    data['districtId'] = this.districtId;
    if (this.district != null) {
      data['district'] = this.district.toJson();
    }
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}

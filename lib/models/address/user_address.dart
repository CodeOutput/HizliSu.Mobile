import 'package:hizli_su/models/address/city.dart';
import 'package:hizli_su/models/address/district.dart';
import 'package:hizli_su/models/address/neighborhood.dart';

class UserAddress {
  String title;
  int userId;
  int cityId;
  City city;
  int districtId;
  District district;
  int neighborhoodId;
  Neighborhood neighborhood;
  String streetName;
  String no;
  String doorNumber;
  String addressDescription;
  String phoneNumber;
  bool isActive;
  String lastModificationTime;
  int lastModifierUserId;
  DateTime creationTime;
  int creatorUserId;
  int id;

  UserAddress(
      {this.title,
        this.userId,
        this.cityId,
        this.city,
        this.districtId,
        this.district,
        this.neighborhoodId,
        this.neighborhood,
        this.streetName,
        this.no,
        this.doorNumber,
        this.addressDescription,
        this.phoneNumber,
        this.isActive,
        this.lastModificationTime,
        this.lastModifierUserId,
        this.creationTime,
        this.creatorUserId,
        this.id});

  UserAddress.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    userId = json['userId'];
    cityId = json['cityId'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    districtId = json['districtId'];
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    neighborhoodId = json['neighborhoodId'];
    neighborhood = json['neighborhood'] != null
        ? new Neighborhood.fromJson(json['neighborhood'])
        : null;
    streetName = json['streetName'];
    no = json['no'];
    doorNumber = json['doorNumber'];
    addressDescription = json['addressDescription'];
    phoneNumber = json['phoneNumber'];
    isActive = json['isActive'];
    lastModificationTime = json['lastModificationTime'];
    lastModifierUserId = json['lastModifierUserId'];
    creationTime = json["creationTime"] == null ? null: DateTime.parse(json["creationTime"]);

    creatorUserId = json['creatorUserId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['userId'] = this.userId;
    data['cityId'] = this.cityId;
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    data['districtId'] = this.districtId;
    if (this.district != null) {
      data['district'] = this.district.toJson();
    }
    data['neighborhoodId'] = this.neighborhoodId;
    if (this.neighborhood != null) {
      data['neighborhood'] = this.neighborhood.toJson();
    }
    data['streetName'] = this.streetName;
    data['no'] = this.no;
    data['doorNumber'] = this.doorNumber;
    data['addressDescription'] = this.addressDescription;
    data['phoneNumber'] = this.phoneNumber;
    data['isActive'] = this.isActive;
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime?.toIso8601String();
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}
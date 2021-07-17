import 'package:hizli_su/models/catalog/facility_attribute.dart';

import 'manufacturer_model.dart';

class Facility {
  int manufacturerId;
  Manufacturer manufacturer;
  String name;
  String description;
  String address;
  List<FacilityAttribute> facilityAttributes;
  String lastModificationTime;
  int lastModifierUserId;
  String creationTime;
  int creatorUserId;
  int id;

  Facility(
      {this.manufacturerId,
        this.manufacturer,
        this.name,
        this.description,
        this.address,
        this.facilityAttributes,
        this.lastModificationTime,
        this.lastModifierUserId,
        this.creationTime,
        this.creatorUserId,
        this.id});

  Facility.fromJson(Map<String, dynamic> json) {
    manufacturerId = json['manufacturerId'];
    manufacturer = json['manufacturer'] != null
        ? new Manufacturer.fromJson(json['manufacturer'])
        : null;
    name = json['name'];
    description = json['description'];
    address = json['address'];
    if (json['facilityAttributes'] != null) {
      facilityAttributes = new List<FacilityAttribute>.empty(growable: true);
      json['facilityAttributes'].forEach((v) {
        facilityAttributes.add(new FacilityAttribute.fromJson(v));
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
    data['manufacturerId'] = this.manufacturerId;
    if (this.manufacturer != null) {
      data['manufacturer'] = this.manufacturer.toJson();
    }
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    if (this.facilityAttributes != null) {
      data['facilityAttributes'] =
          this.facilityAttributes.map((v) => v.toJson()).toList();
    }

    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}

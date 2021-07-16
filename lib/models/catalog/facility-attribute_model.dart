class FacilityAttributes {
  int facilityId;
  String key;
  String value;
  int sortOrder;
  String lastModificationTime;
  int lastModifierUserId;
  String creationTime;
  int creatorUserId;
  int id;

  FacilityAttributes(
      {this.facilityId,
        this.key,
        this.value,
        this.sortOrder,
        this.lastModificationTime,
        this.lastModifierUserId,
        this.creationTime,
        this.creatorUserId,
        this.id});

  FacilityAttributes.fromJson(Map<String, dynamic> json) {
    facilityId = json['facilityId'];
    key = json['key'];
    value = json['value'];
    sortOrder = json['sortOrder'];
    lastModificationTime = json['lastModificationTime'];
    lastModifierUserId = json['lastModifierUserId'];
    creationTime = json['creationTime'];
    creatorUserId = json['creatorUserId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facilityId'] = this.facilityId;
    data['key'] = this.key;
    data['value'] = this.value;
    data['sortOrder'] = this.sortOrder;
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}

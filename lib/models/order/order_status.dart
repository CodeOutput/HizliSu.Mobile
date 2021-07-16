class OrderStatus {
  String name;
  bool isActive;
  String lastModificationTime;
  int lastModifierUserId;
  String creationTime;
  int creatorUserId;
  int id;

  OrderStatus(
      {this.name,
        this.isActive,
        this.lastModificationTime,
        this.lastModifierUserId,
        this.creationTime,
        this.creatorUserId,
        this.id});

  OrderStatus.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isActive = json['isActive'];
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
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}
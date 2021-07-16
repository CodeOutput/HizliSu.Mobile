import 'package:hizli_su/models/address/user_address.dart';
import 'package:hizli_su/models/order/order_status.dart';

class Order {
  int userId;
  int userAddressId;
  UserAddress userAddress;
  int orderStatusId;
  OrderStatus orderStatus;
  String orderNote;
  double totalPrice;
  String lastModificationTime;
  int lastModifierUserId;
  DateTime creationTime;
  int creatorUserId;
  int id;

  Order(
      {this.userId,
      this.userAddressId,
      this.userAddress,
      this.orderStatusId,
      this.orderStatus,
      this.orderNote,
      this.totalPrice,
      this.lastModificationTime,
      this.lastModifierUserId,
      this.creationTime,
      this.creatorUserId,
      this.id});

  Order.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userAddressId = json['userAddressId'];
    userAddress = json['userAddress'] != null
        ? new UserAddress.fromJson(json['userAddress'])
        : null;
    orderStatusId = json['orderStatusId'];
    orderStatus = json['orderStatus'] != null
        ? new OrderStatus.fromJson(json['orderStatus'])
        : null;
    orderNote = json['orderNote'];
    totalPrice = json['totalPrice'];
    lastModificationTime = json['lastModificationTime'];
    lastModifierUserId = json['lastModifierUserId'];
    creationTime = json["creationTime"] == null ? null: DateTime.parse(json["creationTime"]);
    creatorUserId = json['creatorUserId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userAddressId'] = this.userAddressId;
    if (this.userAddress != null) {
      data['userAddress'] = this.userAddress.toJson();
    }
    data['orderStatusId'] = this.orderStatusId;
    if (this.orderStatus != null) {
      data['orderStatus'] = this.orderStatus.toJson();
    }
    data['orderNote'] = this.orderNote;
    data['totalPrice'] = this.totalPrice;
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}

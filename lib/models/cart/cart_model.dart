import 'package:hizli_su/models/auth/user_model.dart';
import 'package:hizli_su/models/catalog/product_model.dart';

class Cart {
  int productId;
  Product product;
  int userId;
  User user;
  int quantity;
  String lastModificationTime;
  int lastModifierUserId;
  String creationTime;
  int creatorUserId;
  int id;

  Cart(
      {this.productId,
        this.product,
        this.userId,
        this.user,
        this.quantity,
        this.lastModificationTime,
        this.lastModifierUserId,
        this.creationTime,
        this.creatorUserId,
        this.id});

  Cart.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    userId = json['userId'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    quantity = json['quantity'];
    lastModificationTime = json['lastModificationTime'];
    lastModifierUserId = json['lastModifierUserId'];
    creationTime = json['creationTime'];
    creatorUserId = json['creatorUserId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    data['userId'] = this.userId;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['quantity'] = this.quantity;
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}

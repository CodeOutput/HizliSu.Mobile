import 'package:hizli_su/models/catalog/product_model.dart';

class OrderItem {
  int orderId;
  Null order;
  int productId;
  Product product;
  int quantity;
  double price;
  String lastModificationTime;
  int lastModifierUserId;
  String creationTime;
  int creatorUserId;
  int id;

  OrderItem(
      {this.orderId,
        this.order,
        this.productId,
        this.product,
        this.quantity,
        this.price,
        this.lastModificationTime,
        this.lastModifierUserId,
        this.creationTime,
        this.creatorUserId,
        this.id});

  OrderItem.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    order = json['order'];
    productId = json['productId'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    price = json['price'];
    lastModificationTime = json['lastModificationTime'];
    lastModifierUserId = json['lastModifierUserId'];
    creationTime = json['creationTime'];
    creatorUserId = json['creatorUserId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['order'] = this.order;
    data['productId'] = this.productId;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}

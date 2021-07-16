import 'package:hizli_su/models/catalog/product_model.dart';

class CartItemModel {
  int id;
  bool productPublished;
  int cartQuantity;
  bool isShoppingBag;
  bool isCargo;
  Product product;
  double discount;

  List<String> discountNames;



  CartItemModel(
      {this.id,
      this.cartQuantity,
      this.productPublished,
      this.product,
      this.isCargo,
      this.isShoppingBag,
      this.discount,
      this.discountNames});

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
        id: json['Id'],
        product: json['Product'] == null
            ? null
            : Product.fromJson(json['Product']),
        cartQuantity: json['CartQuantity'],
        productPublished: json['ProductPublished'],
        isCargo: json['IsCargo'],
        isShoppingBag: json['IsShoppingBag'],
        discount: json['Discount'],
        discountNames: List<String>.from(json['DiscountNames'].map((x) => x)));
  }


}

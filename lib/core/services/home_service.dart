import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:hizli_su/core/main_service.dart';
import 'package:hizli_su/models/cart/cart_item_model.dart';
import 'package:hizli_su/models/cart/cart_model.dart';
import 'package:hizli_su/models/cart/cart_result.dart';
import 'package:hizli_su/models/catalog/category_result.dart';
import 'package:hizli_su/models/catalog/product_result_model.dart';

class HomeService {

  Future<CategoryResult> getCategoryListAsync() async {
    Response resp = await MainService().get('/services/app/Category/GetCategoryList');
    return CategoryResult.fromJson(resp.data);
  }
  Future<ProductResult> getProductListAsync() async {
    Response resp = await MainService().get('/services/app/Product/GetProductList');
    return ProductResult.fromJson(resp.data);
  }

  Future<Cart> addToCart(CartItemModel item) async {
    Map<String, dynamic> requestBody = {
      "productId": item.product.id,
      "quantity": item.cartQuantity
    };
    Response resp = await MainService().post('/services/app/Cart/SaveOrUpdateCart', data: requestBody);
    return Cart.fromJson(resp.data);
  }

  Future<CartResult> getCartList() async {
    Response resp = await MainService().get('/services/app/Cart/GetCartList');
    return CartResult.fromJson(resp.data);
  }
  Future<CartResult> getCartAllList() async {
    Response resp = await MainService().get('/services/app/Cart/GetCartAllList');
    return CartResult.fromJson(resp.data);
  }
}
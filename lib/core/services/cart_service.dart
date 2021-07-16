import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:hizli_su/core/main_service.dart';
import 'package:hizli_su/models/cart/cart_item_model.dart';
import 'package:hizli_su/models/cart/cart_model.dart';
import 'package:hizli_su/models/cart/cart_result.dart';
import 'package:hizli_su/models/catalog/category_result.dart';
import 'package:hizli_su/models/catalog/product_result_model.dart';

class CartService {

  Future<CartResult> getCartAllList() async {
    Response resp = await MainService().get('/services/app/Cart/GetCartAllList');
    return CartResult.fromJson(resp.data);
  }
}
import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:hizli_su/core/main_service.dart';
import 'package:hizli_su/models/address/city_result.dart';
import 'package:hizli_su/models/address/district_result.dart';
import 'package:hizli_su/models/address/neighborhood_result.dart';
import 'package:hizli_su/models/address/save_user_address_result.dart';
import 'package:hizli_su/models/address/user_address.dart';
import 'package:hizli_su/models/address/user_address_result.dart';
import 'package:hizli_su/models/cart/cart_item_model.dart';
import 'package:hizli_su/models/cart/cart_model.dart';
import 'package:hizli_su/models/cart/cart_result.dart';
import 'package:hizli_su/models/catalog/category_result.dart';
import 'package:hizli_su/models/catalog/product_result_model.dart';
import 'package:hizli_su/models/order/order.dart';
import 'package:hizli_su/models/order/save_order_result.dart';

class PaymentService {

  Future<UserAddressResult> getAuthUserAddressList() async {
    Response resp = await MainService().get('/services/app/UserAddress/GetAuthUserAddressList');
    return UserAddressResult.fromJson(resp.data);
  }

  Future<SaveUserAddressResult> saveUserAddress(UserAddress address) async {
    Response resp = await MainService().post('/services/app/UserAddress/SaveUserAddress', data: address.toJson());
    return SaveUserAddressResult.fromJson(resp.data);
  }

  Future<SaveOrderResult> saveOrder(Order order) async {
    Response resp = await MainService().post('/services/app/Order/SaveOrder', data: order.toJson());
    return SaveOrderResult.fromJson(resp.data);
  }

  Future<CityResult> getCityList() async {
    Response resp = await MainService().get('/services/app/City/GetCityList?isActive=true');
    return CityResult.fromJson(resp.data);
  }
  Future<DistrictResult> getDistrictList(int cityId) async {
    Response resp = await MainService().get('/services/app/District/GetDistrictList?cityId=$cityId&isActive=true');
    return DistrictResult.fromJson(resp.data);
  }
  Future<NeighborhoodResult> getNeighborhoodList(int districtId) async {
    Response resp = await MainService().get('/services/app/Neighborhood/GetNeighborhoodList?districtId=$districtId&isActive=true');
    return NeighborhoodResult.fromJson(resp.data);
  }
}
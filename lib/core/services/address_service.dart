import 'package:dio/src/response.dart';
import 'package:hizli_su/core/main_service.dart';
import 'package:hizli_su/models/address/city_result.dart';
import 'package:hizli_su/models/address/district_result.dart';
import 'package:hizli_su/models/address/neighborhood_result.dart';
import 'package:hizli_su/models/address/save_user_address_result.dart';
import 'package:hizli_su/models/address/user_address.dart';
import 'package:hizli_su/models/address/user_address_detail_result.dart';
import 'package:hizli_su/models/address/user_address_result.dart';
import 'package:hizli_su/models/order/order_detail_result.dart';
import 'package:hizli_su/models/order/order_item_result.dart';
import 'package:hizli_su/models/order/order_result.dart';

class AddressService {

  Future<UserAddressResult> getAuthUserAddressList() async {
    Response resp = await MainService().get('/services/app/UserAddress/GetAuthUserAddressList');
    return UserAddressResult.fromJson(resp.data);
  }

  Future<SaveUserAddressResult> saveUserAddress(UserAddress address) async {
    Response resp = await MainService().post('/services/app/UserAddress/SaveUserAddress', data: address.toJson());
    return SaveUserAddressResult.fromJson(resp.data);
  }

  Future<SaveUserAddressResult> updateUserAddress(int adressId, UserAddress address) async {
    Response resp = await MainService().put('/services/app/UserAddress/UpdateUserAddress?userAddressId=$adressId', data: address.toJson());
    return SaveUserAddressResult.fromJson(resp.data);
  }

  Future<UserAddressDetailResult> getUserAddressDetail(int addressId) async {
    Response resp = await MainService().get(
        '/services/app/UserAddress/GetAuthUserAddressDetail?addressId=$addressId');
    return UserAddressDetailResult.fromJson(resp.data);
  }

  Future<UserAddressDetailResult> deleteAddress(int addressId) async {
    Response resp = await MainService().delete(
        '/services/app/UserAddress/DeleteUserAddress?userAddressId=$addressId');
    return UserAddressDetailResult.fromJson(resp.data);
  }

  Future<CityResult> getCityList() async {
    Response resp =
        await MainService().get('/services/app/City/GetCityList?isActive=true');
    return CityResult.fromJson(resp.data);
  }

  Future<DistrictResult> getDistrictList(int cityId) async {
    Response resp = await MainService().get(
        '/services/app/District/GetDistrictList?cityId=$cityId&isActive=true');
    return DistrictResult.fromJson(resp.data);
  }

  Future<NeighborhoodResult> getNeighborhoodList(int districtId) async {
    Response resp = await MainService().get(
        '/services/app/Neighborhood/GetNeighborhoodList?districtId=$districtId&isActive=true');
    return NeighborhoodResult.fromJson(resp.data);
  }
}

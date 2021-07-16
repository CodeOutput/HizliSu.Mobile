import 'package:get/get.dart';
import 'package:hizli_su/core/services/address_service.dart';
import 'package:hizli_su/core/services/order_service.dart';
import 'package:hizli_su/core/services/payment_service.dart';
import 'package:hizli_su/models/address/city.dart';
import 'package:hizli_su/models/address/district.dart';
import 'package:hizli_su/models/address/neighborhood.dart';
import 'package:hizli_su/models/address/user_address.dart';
import 'package:hizli_su/models/order/order.dart';
import 'package:hizli_su/models/order/order_item.dart';

class AddressPageModel extends GetxController {
  RxBool loading = false.obs;
  RxList<UserAddress> userAddresses = new List<UserAddress>.empty(
      growable: true).obs;

  Rx<UserAddress> userAddress = new UserAddress().obs;
  RxList<City> cities = new List<City>.empty(growable: true).obs;
  RxList<District> districts = new List<District>.empty(growable: true).obs;
  RxList<Neighborhood> neighborhoods = new List<Neighborhood>.empty(
      growable: true).obs;

  AddressPageModel() {
    getAuthUserAddressList();
    getCityList();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getAuthUserAddressList() async {
    loading.value = false;
    var value = await AddressService().getAuthUserAddressList();
    userAddresses.value = value.result.items;
    loading.value = true;
  }

  getAddressDetail(int addressId) async {
    loading.value = false;
    var value = await AddressService().getUserAddressDetail(addressId);
    userAddress.value = value.result;
    loading.value = true;
  }

  deleteAddress(int addressId) async {
    loading.value = false;
    await AddressService().deleteAddress(addressId);
    userAddress.value = new UserAddress();
    loading.value = true;
  }

  getCityList() async {
    loading.value = false;
    await AddressService().getCityList().then((value) {
      cities.value = value.result.items;
      loading.value = true;
    });
  }

  getDistrictList(int cityId) async {
    loading.value = false;
    await AddressService().getDistrictList(cityId).then((value) {
      districts.value = value.result.items;
      loading.value = true;
    });
  }

  getNeighborhoodList(int districtId) async {
    loading.value = false;
    await AddressService().getNeighborhoodList(districtId).then((value) {
      neighborhoods.value = value.result.items;
      loading.value = true;
    });
  }

  saveUserAddress(UserAddress address) async {
    loading.value = false;
    var value = await AddressService().saveUserAddress(address);
    userAddress.value = value.result;
    loading.value = true;
  }
  updateUserAddress(int addressId, UserAddress address) async {
    loading.value = false;
    var value = await AddressService().updateUserAddress(addressId,address);
    userAddress.value = value.result;
    loading.value = true;
  }
}

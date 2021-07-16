import 'package:get/get.dart';
import 'package:hizli_su/core/services/payment_service.dart';
import 'package:hizli_su/models/address/city.dart';
import 'package:hizli_su/models/address/district.dart';
import 'package:hizli_su/models/address/neighborhood.dart';
import 'package:hizli_su/models/address/user_address.dart';
import 'package:hizli_su/models/order/order.dart';


class PaymentPageModel extends GetxController {
  RxBool loading = false.obs;
  RxList<UserAddress> userAddresses = new List<UserAddress>.empty(growable: true).obs;

  RxList<City> cities = new List<City>.empty(growable: true).obs;
  RxList<District> districts = new List<District>.empty(growable: true).obs;
  RxList<Neighborhood> neighborhoods = new List<Neighborhood>.empty(growable: true).obs;

  Rx<UserAddress> userAddress = new UserAddress().obs;
  Rx<Order> order = new Order().obs;

  PaymentPageModel() {
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
    await PaymentService().getAuthUserAddressList().then((value){
      userAddresses.value = value.result.items;
      loading.value = true;
      //print('___________________________________ADRESS________________');
    });
    //update();
  }
  saveUserAddress(UserAddress address) async {
    loading.value = false;
    await PaymentService().saveUserAddress(address).then((value){
      userAddress.value = value.result;
      loading.value = true;
    });
  }
  saveOrder(Order row) async {
    loading.value = false;
    await PaymentService().saveOrder(row).then((value){
      order.value = value.result;
      loading.value = true;
    });
  }
  getCityList() async {
    loading.value = false;
    await PaymentService().getCityList().then((value){
      cities.value = value.result.items;
      loading.value = true;
    });
  }
  getDistrictList(int cityId) async {
    loading.value = false;
    await PaymentService().getDistrictList(cityId).then((value){
      districts.value = value.result.items;
      loading.value = true;
    });
  }
  getNeighborhoodList(int districtId) async {
    loading.value = false;
    await PaymentService().getNeighborhoodList(districtId).then((value){
      neighborhoods.value = value.result.items;
      loading.value = true;
    });
  }
}

import 'package:get/get.dart';
import 'package:hizli_su/core/services/payment_service.dart';
import 'package:hizli_su/models/address/user_address.dart';
import 'package:hizli_su/models/order/order.dart';


class PaymentPageModel extends GetxController {
  RxBool loading = false.obs;
  // RxList<UserAddress> userAddresses = new List<UserAddress>.empty(growable: true).obs;


  Rx<Order> order = new Order().obs;

  PaymentPageModel() {
    // getAuthUserAddressList();
    // getCityList();
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



  saveOrder(Order row) async {
    loading.value = false;
    await PaymentService().saveOrder(row).then((value){
      order.value = value.result;
      loading.value = true;
    });
  }

}

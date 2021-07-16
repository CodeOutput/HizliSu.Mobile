import 'package:get/get.dart';
import 'package:hizli_su/core/services/order_service.dart';
import 'package:hizli_su/models/order/order.dart';
import 'package:hizli_su/models/order/order_item.dart';


class OrderPageModel extends GetxController {
  RxBool loading = false.obs;
  Rx<Order> order = new Order().obs;
  RxList<Order> orders = new List<Order>.empty(growable: true).obs;
  RxList<OrderItem> orderItems = new List<OrderItem>.empty(growable: true).obs;


  OrderPageModel() {
    getOrderList();
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

  getOrderList() async {
    loading.value = false;
    await OrderService().getOrderList().then((value){
      orders.value = value.result.items;
      loading.value = true;
      //print('___________________________________ADRESS________________');
    });
  }

  getOrderItemList(int orderId) async {
    loading.value = false;
    await OrderService().getOrderItemList(orderId).then((value){
      orderItems.value = value.result.items;
      loading.value = true;
      //print('___________________________________ADRESS________________');
    });
  }
  getOrderDetail(int orderId) async {
    loading.value = false;
    await OrderService().getOrderDetail(orderId).then((value){
      order.value = value.result;
      loading.value = true;
      //print('___________________________________ADRESS________________');
    });
  }
  saveOrderCancel(int orderId) async {
    loading.value = false;
    await OrderService().saveOrderCancel(orderId).then((value){
      order.value = value.result;
      loading.value = true;
      //print('___________________________________ADRESS________________');
    });
  }

}

import 'package:dio/src/response.dart';
import 'package:hizli_su/core/main_service.dart';
import 'package:hizli_su/models/order/order_detail_result.dart';
import 'package:hizli_su/models/order/order_item_result.dart';
import 'package:hizli_su/models/order/order_result.dart';

class OrderService {

  Future<OrderResult> getOrderList() async {
    Response resp = await MainService().get('/services/app/Order/GetOrderList');
    return OrderResult.fromJson(resp.data);
  }
  Future<OrderDetailResult> getOrderDetail(int orderId) async {
    Response resp = await MainService().get('/services/app/Order/GetOrderDetail?orderId=$orderId');
    return OrderDetailResult.fromJson(resp.data);
  }

  Future<OrderItemResult> getOrderItemList(int orderId) async {
    Response resp = await MainService().get('/services/app/Order/GetOrderItemList?orderId=$orderId');
    return OrderItemResult.fromJson(resp.data);
  }

  Future<OrderDetailResult> saveOrderCancel(int orderId) async {
    Response resp = await MainService().post('/services/app/Order/SaveOrderCancel?orderId=$orderId');
    return OrderDetailResult.fromJson(resp.data);
  }
}
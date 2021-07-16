import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/page_model/order_page_model.dart';
import 'package:hizli_su/enums/e_order_status.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/helpers/custom_alert_message.dart';
import 'package:hizli_su/pages/order/order_page.dart';
import 'package:hizli_su/pages/widgets/order_item_widget.dart';
import 'package:hizli_su/pages/widgets/price_text_widget.dart';
import 'package:intl/intl.dart';

class OrderDetailPage extends StatelessWidget {
  final orderPageCtrl = Get.find<OrderPageModel>();
  final int orderId;
  int orderStatusId;

  OrderDetailPage({@required this.orderId, @required this.orderStatusId}) {
    orderPageCtrl.getOrderDetail(orderId);
    orderPageCtrl.getOrderItemList(orderId);
  }

  Future<void> _onRefresh() async {
    await orderPageCtrl.getOrderDetail(orderId);
    orderStatusId = orderPageCtrl.order.value.orderStatusId;
    await orderPageCtrl.getOrderItemList(orderId);
    // getBottomNavigationBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sipariş Detayı'),
      ),
      body: body(context),
      bottomNavigationBar: getBottomNavigationBar(context),
    );
  }

  Widget body(BuildContext context) {
    return Obx(() => RefreshIndicator(
          onRefresh: _onRefresh,
          child: orderPageCtrl?.order?.value?.orderStatus != null? SafeArea(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 2.0, color: primaryColor),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.only(
                          left: 0.0, right: 0.0, top: 0, bottom: 0),
                      title: Text(orderPageCtrl.order.value.orderStatus.name,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 16.0),
                        dense: true,
                        title: Text("Toplam Sipariş Fiyatı"),
                        trailing: PriceTextWidget(
                          price: orderPageCtrl.order.value.totalPrice,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                          ),
                        )),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                      dense: true,
                      title: Text("Sipariş Tarihi"),
                      trailing: Text(
                          "${DateFormat("dd.MM.yyyy HH:mm").format(orderPageCtrl.order.value.creationTime)}"),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                      dense: true,
                      title: Text("Adres Başlık"),
                      trailing: Text(
                          "${orderPageCtrl.order.value.userAddress.title}"),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                      dense: true,
                      title: Text("Sipariş Numarası"),
                      trailing: Text("${orderPageCtrl.order.value.id}"),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.blueGrey,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                      dense: true,
                      title: Text("Şehir/İlçe/Mah"),
                      trailing: Text(
                          "${orderPageCtrl.order.value.userAddress.city.name}/${orderPageCtrl.order.value.userAddress.district.name}/${orderPageCtrl.order.value.userAddress.neighborhood.name}"),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.blueGrey,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                      dense: true,
                      title: Text("Sokak/No/Kapı"),
                      trailing: Text(
                          "${orderPageCtrl.order.value.userAddress.streetName}/${orderPageCtrl.order.value.userAddress.no}/${orderPageCtrl.order.value.userAddress.doorNumber}"),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.blueGrey,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                      dense: true,
                      title: Text("Teslimat Telefonu"),
                      trailing: Text(
                          "${orderPageCtrl.order.value.userAddress.phoneNumber}"),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.blueGrey,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                      dense: true,
                      title: Text("Sipariş Notu"),
                      subtitle: Text("${orderPageCtrl.order.value.orderNote}"),
                    ),
                  ],
                ),
                Divider(
                  height: 1,
                  color: Colors.blueGrey,
                ),
                SizedBox(height: 10,),

                // ListTileMoreCustomizable(
                //   contentPadding:
                //   EdgeInsets.only(top: 2, right: 24, left: 29),
                //   horizontalTitleGap: -5.0,
                //   minVerticalPadding: 0.0,
                //   trailing: orderPageCtrl.orderItems.length > 0
                //       ? Text(
                //     orderPageCtrl.orderItems.length.toString() +
                //         ' Ürün',
                //     style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         color: primaryColor),
                //   )
                //       : Container(),
                //   title: Text(
                //     'Siparişteki Ürünler',
                //     style: TextStyle(
                //         fontSize: 15, fontWeight: FontWeight.w600),
                //   ),
                // ),

                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: orderPageCtrl.orderItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: OrderItemWidget(
                          item: orderPageCtrl.orderItems[index],
                          showDivider:
                              (index + 1) < orderPageCtrl.orderItems.length
                                  ? true
                                  : false,
                        ),
                      );
                    }),
              ],
            ),
          ):Center(child: Text("Yükleniyor...")),
        ));
  }

   getBottomNavigationBar(BuildContext context)  {
    if(orderStatusId == EOrderStatus.OnayBekliyor.value) {
      return Container(
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ElevatedButton(
                    onPressed: () async{
                      if (orderPageCtrl.order?.value?.orderStatus?.id ==
                          EOrderStatus.OnayBekliyor.value) {

                        CustomAlertMessage.showAlertMessageWithContent(
                          context,
                          title: 'UYARI',
                          body: Column(
                            children: [
                              Text(
                                  'Siparişini iptal edilecektir. Devam etmek istyor musunuz ?'),
                            ],
                          ),
                          okButtonText: 'EVET',
                          okButtonPressed: () async {
                            Get.back();
                            await orderPageCtrl.saveOrderCancel(orderId);
                            Get.snackbar("Sipariş durumu",
                                "Sipariş başarıyla iptal edilmiştir!", snackPosition: SnackPosition.BOTTOM);
                            await orderPageCtrl.getOrderList();

                            Timer(Duration(seconds: 3), () => Get.to(() => OrderPage()));;
                          },
                          cancelButtonText: 'HAYIR',
                          cancelButtonPressed: () {
                            Get.back();
                          },
                        );
                      } else {
                        Get.snackbar("Sipariş durumu",
                            "Sipariş durumunuzu artık değiştiremezsiniz.", snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    child: Text('Siparişi İptal Et'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      onPrimary: Colors.white,
                      primary: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      shadowColor: Colors.pinkAccent,
                    )),
              )
            ],
          ));
    }
  }
}

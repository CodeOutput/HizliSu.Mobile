import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/binding.dart';
import 'package:hizli_su/core/page_model/order_page_model.dart';
import 'package:hizli_su/core/routes.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/models/order/order.dart';
import 'package:hizli_su/pages/order/order_detail_page.dart';
import 'package:hizli_su/pages/widgets/price_text_widget.dart';
import 'package:intl/intl.dart';

class OrderPage extends StatelessWidget {
  final orderPageCtrl = Get.find<OrderPageModel>();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: AppBar(
          title: Text('Siparişler'),
          actions: appBarActions(),
        ),

        body: body(context),
    );
  }

  List<Widget> appBarActions() {
    return [
      IconButton(
        icon: Icon(
          Icons.exit_to_app,
        ),
        onPressed: () {
        },
      ),
    ];
  }

  Widget body(BuildContext context) {
    return Obx(() => GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
            child: Column(
              children: orderPageCtrl.orders.value
                  .map(
                    (item) => GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 5),
                    decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding:
                            const EdgeInsets.only(top: 0.0),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    "${item.orderStatus.name}",
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.bold),
                                  ),
                                ),
                                Divider(height: 1,thickness: 3, color: primaryColor,),
                                ListTile(
                                  contentPadding:
                                  EdgeInsets.symmetric(
                                      vertical: 0.0,
                                      horizontal: 16.0),
                                  dense: true,
                                  title: Text("Toplam Sipariş Fiyatı"),
                                  trailing: PriceTextWidget(price: item.totalPrice,
                                    style: TextStyle(fontSize: 22,  fontWeight: FontWeight.w500, color: primaryColor,),)),
                                Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                ListTile(
                                  contentPadding:
                                  EdgeInsets.symmetric(
                                      vertical: 0.0,
                                      horizontal: 16.0),
                                  dense: true,
                                  title: Text("Sipariş Tarihi"),
                                  trailing:
                                  Text("${DateFormat("dd.MM.yyyy HH:mm").format(item.creationTime)}"),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                ListTile(
                                  contentPadding:
                                  EdgeInsets.symmetric(
                                      vertical: 0.0,
                                      horizontal: 16.0),
                                  dense: true,
                                  title: Text("Adres Başlık"),
                                  trailing:
                                  Text("${item.userAddress.title}"),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.blueGrey,
                                ),
                                ListTile(
                                  contentPadding:
                                  EdgeInsets.symmetric(
                                      vertical: 0.0,
                                      horizontal: 16.0),
                                  dense: true,
                                  title: Text("Şehir/İlçe/Mah"),
                                  trailing: Text(
                                      "${item.userAddress.city.name}/${item.userAddress.district.name}/${item.userAddress.neighborhood.name}"),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.blueGrey,
                                ),
                                ListTile(
                                  contentPadding:
                                  EdgeInsets.symmetric(
                                      vertical: 0.0,
                                      horizontal: 16.0),
                                  dense: true,
                                  title: Text("Sokak/No/Kapı"),
                                  trailing: Text(
                                      "${item.userAddress.streetName}/${item.userAddress.no}/${item.userAddress.doorNumber}"),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.blueGrey,
                                ),
                                ListTile(
                                  contentPadding:
                                  EdgeInsets.symmetric(
                                      vertical: 0.0,
                                      horizontal: 16.0),
                                  dense: true,
                                  title: Text("Teslimat Telefonu"),
                                  trailing: Text(
                                      "${item.userAddress.phoneNumber}"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    orderPageCtrl.order.value = new Order();
                    Get.to(OrderDetailPage(orderId: item.id,orderStatusId: item.orderStatus.id,), binding: Binding());
                  },
                ),
              )
                  .toList(),
            ),
          ),
        ),
      ),
    ));
  }
  Future<void> _onRefresh() async {
    orderPageCtrl.getOrderList();
  }
}


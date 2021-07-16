import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/binding.dart';
import 'package:hizli_su/core/page_model/home_page_model.dart';
import 'package:hizli_su/core/page_model/payment_page_model.dart';
import 'package:hizli_su/core/routes.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/models/address/user_address.dart';
import 'package:hizli_su/models/cart/cart_model.dart';
import 'package:hizli_su/pages/address/address_page.dart';
import 'package:hizli_su/pages/home_page.dart';
import 'package:hizli_su/pages/main_page.dart';
import 'package:hizli_su/pages/widgets/cart_footer_widget.dart';
import 'package:hizli_su/pages/widgets/custom_button.dart';
import 'package:hizli_su/pages/widgets/custom_text.dart';

class PaymentPage extends StatelessWidget {
  final paymentPageCtrl = Get.find<PaymentPageModel>();
  final homePageCtrl = Get.find<HomePageModel>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ödeme Detayı'),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 0),
                            child: Column(
                              children: [
                                FractionallySizedBox(
                                  widthFactor: 1,
                                  child: DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(right: 5),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[500])),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepOrange)),
                                      hintText: 'Teslimat Adresi',
                                      labelText: 'Teslimat Adresi',
                                    ),
                                    value: paymentPageCtrl
                                        .order.value.userAddressId,
                                    onChanged: (int value) {
                                      paymentPageCtrl
                                          .order.value.userAddressId = value;
                                    },
                                    items: paymentPageCtrl.userAddresses?.value
                                        .map(
                                          (UserAddress address) =>
                                              DropdownMenuItem(
                                            child: Text("${address.title}"),
                                            value: address.id,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: CustomButton(
                              text: 'Yeni Adres Ekle',
                              onPressed: () {
                                Get.to(() => AddressPage(), binding: Binding());
                              },
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      maxLength: 255,
                      initialValue: paymentPageCtrl.order.value.orderNote,
                      onSaved: (String value) {
                        paymentPageCtrl.order.value.orderNote = value;
                      },
                      decoration: InputDecoration(
                          labelText: 'Sipariş Notu',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(new Radius.circular(0.0))),
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 20)),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                      //controller: host,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CustomText(
                      text: 'Ödeme Seçenekleri',
                      fontSize: 25,
                      alignment: Alignment.center,
                      color: primaryColor,
                    ),
                    Divider(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 40,
                      color: primaryColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: 'Nakit',
                      fontSize: 24,
                      alignment: Alignment.center,
                      color: primaryColor,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CartFooterWidget(
                        buttonText: 'Siparişi Tamamla',
                        buttonDisabled: false,
                        onPressed: saveOrder)
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> saveOrder() async {
   // print('=========================TIKLANDI=====================');
    if (paymentPageCtrl.order.value.userAddressId == null) {
      Get.snackbar('Sipariş Durumu', 'Lütfen teslimat adresi seçiniz!',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    formKey.currentState.save();
    await paymentPageCtrl.saveOrder(paymentPageCtrl.order.value);
    if ((paymentPageCtrl.order?.value?.id ?? 0) > 0) {
      homePageCtrl.cartItems.value = new List<Cart>.empty(growable: true);
      Get.snackbar('Sipariş Durumu', 'Siparişiniz başarıyla alınmıştır',
          backgroundColor: Colors.green, snackPosition: SnackPosition.BOTTOM);
     // Get.reset();
      Timer(Duration(seconds: 3),
          () => Get.offAll(() => MainPage(), binding: Binding()));
    }
    // await paymentPageCtrl.saveUserAddress(address)
    // Get.to(() => PaymentPage(), binding: Binding());
  }
}

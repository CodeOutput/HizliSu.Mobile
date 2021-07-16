import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/binding.dart';
import 'package:hizli_su/core/page_model/cart_page_model.dart';
import 'package:hizli_su/core/page_model/home_page_model.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/pages/payment_page.dart';
import 'package:hizli_su/pages/widgets/cart_footer_widget.dart';
import 'package:hizli_su/pages/widgets/cart_item_widget.dart';
import 'package:hizli_su/pages/widgets/notfound_widget.dart';
import 'package:intl/intl.dart';
import 'package:list_tile_more_customizable/list_tile_more_customizable.dart';

class CartPage extends StatelessWidget {
  final homePageCtrl = Get.find<HomePageModel>();

  var currencyFormat = new NumberFormat("#,##0.00", "tr_TR");

  Future<void> _onRefresh() async {
    homePageCtrl.getCartAllList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepetim"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
              children: [
              Expanded(
              child: Container(
                  child: Obx(() {
                    if (homePageCtrl.cartItems.isEmpty) {
                      return RefreshIndicator(
                        onRefresh: _onRefresh,
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: NotfoundWidget(
                                title: 'Sepetiniz Boş',
                                description: 'Ürün bulunamadı.'
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return RefreshIndicator(
                        onRefresh: _onRefresh,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             ListTileMoreCustomizable(
                                contentPadding: EdgeInsets.only(
                                    top: 2, right: 24, left: 29),
                                horizontalTitleGap: -5.0,
                                minVerticalPadding: 0.0,
                                trailing: homePageCtrl.getCartItemCount > 0 ? Text( homePageCtrl.cartItems.length.toString() + ' Ürün', style: TextStyle( fontWeight: FontWeight.bold, color: primaryColor),) : Container(),
                                title: Text(
                                  'Sepetinizdeki Ürünler',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),

                            Expanded(
                              child: ListView.builder(
                                  itemCount: homePageCtrl.cartItems.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 24, right: 24),
                                      child: CartItemWidget(
                                        //initialValue: selectedItems.any((e) => e == homePageCtrl.cartItems[index].id),
                                        cartItem: homePageCtrl.cartItems[index],
                                        showDivider:
                                        (index + 1) < homePageCtrl.cartItems.length
                                            ? true
                                            : false,
                                      ),
                                    );
                                  }),
                            ),
                            CartFooterWidget(
                              buttonText: 'DEVAM ET',
                              buttonDisabled: true,
                              onPressed: () async {
                                /// Get.to(());
                                Get.to(() => PaymentPage(), binding: Binding());
                              },
                            )
                          ],
                        ),
                      );
                    }
                  })),
            ),
          ],
        ),
      ),
    );
  }
}


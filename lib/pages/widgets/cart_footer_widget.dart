import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/page_model/home_page_model.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/pages/widgets/custom_button.dart';
import 'package:hizli_su/pages/widgets/price_text_widget.dart';

class CartFooterWidget extends StatelessWidget {
  final bool buttonDisabled;
  final String buttonText;
  final Function onPressed;
  final bool showOnlyOrderItemsTotal;
  final homePageCtrl = Get.find<HomePageModel>();

  CartFooterWidget(
      {this.buttonText,
      this.buttonDisabled,
      this.onPressed,
      this.showOnlyOrderItemsTotal = true});


  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 6),
            ),
          ],
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 20, right: 30, top: 15,bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ürünlerin Toplam Fiyatı:',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      color: primaryColor),
                ),
                 PriceTextWidget(
                      price: homePageCtrl.getCartTotal,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                          fontSize: 26)
                )
              ],
            ),
            //Divider(height: 10,),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: this.buttonText,
              onPressed: this.onPressed,
            )
          ],
        ));
  }
}

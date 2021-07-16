import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/page_model/home_page_model.dart';
import 'package:hizli_su/models/cart/cart_item_model.dart';
import 'package:hizli_su/models/catalog/product_model.dart';
import 'package:hizli_su/pages/widgets/custom_text.dart';
import 'package:hizli_su/pages/widgets/price_text_widget.dart';
import 'package:intl/intl.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final controller = Get.find<HomePageModel>();
  RxBool enabledCartLoading = true.obs;
  RxInt cartQuantity = 0.obs;
  var currencyFormat = new NumberFormat("#,##0.00", "tr_TR");
  ProductWidget({Key key, this.product});

  void _updateCart({bool increase, int quantity}) async {
    enabledCartLoading.value = false;
    var newQuantity = increase ? (quantity + 1) : (quantity - 1);
    var cartItem = new CartItemModel(product: product, cartQuantity: newQuantity);
    await controller.addToCart(cartItem);
    enabledCartLoading.value = true;
    cartQuantity.value = newQuantity;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var primaryColor = Theme.of(context).primaryColor;

    cartQuantity.value = controller.getQuantity(product.id);

    return InkWell(
      onTap: () {
        // Navigator.of(context, rootNavigator: true)
        //     .push(CupertinoPageRoute(builder: (BuildContext context) {
        //   return ProductDetailView(product: widget.product);
        // }));
      },
      child: Obx(() => Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE5E5E5),
                  blurRadius: 6.0,
                  spreadRadius: 0.0,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            width: size.width,
            height: size.height,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(left: 0, right: 0, top: 10),
                      child: Container(
                        child: Center(
                            child: Image.memory(
                                base64Decode(product.image.content))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            maxLines: 3,
                            style: TextStyle(
                                color: const Color(0xFF333953),
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.manufacturer.name,
                                style: TextStyle(
                                    color: const Color(0xFF333953),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              Text(
                                "x${product.unitQuantity} Adet",
                                style: TextStyle(
                                    color: const Color(0xFF333953),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              )
                            ],
                          ),
                          SizedBox(height:5),
                          Text(
                            "Birim Fiyatı: ${currencyFormat.format(product.unitPrice)} TL",
                            style: TextStyle(
                                color: const Color(0xFF333953),
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          PriceTextWidget(
                            price: product.price,
                            style: TextStyle(
                                fontSize: 26,
                                color: primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: controller.inCart(product.id)
                            ? Container(
                                margin: EdgeInsets.only(top: 12, bottom: 12),
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () => _updateCart(
                                          increase: false,
                                          quantity: cartQuantity.value),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        child: Icon(
                                          Icons.remove,
                                          size: 23,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 30,
                                      child: Center(
                                        child: enabledCartLoading.value
                                            ? Text(
                                                cartQuantity.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 19),
                                                textAlign: TextAlign.center,
                                              )
                                            : SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    valueColor:
                                                        new AlwaysStoppedAnimation<
                                                                Color>(
                                                            Colors.white),
                                                    backgroundColor:
                                                        primaryColor),
                                              ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => enabledCartLoading.value
                                          ? _updateCart(
                                              increase: true,
                                              quantity: cartQuantity.value)
                                          : null,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        child: Icon(
                                          Icons.add,
                                          size: 23,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    fontSize: 18,
                                    text: "Sepete Ekle",
                                    alignment: Alignment.centerLeft,
                                  ),
                                  controller.inCart(product.id)
                                      ? Container()
                                      : InkWell(
                                          onTap: () {
                                            print('Sepete ekle + tıklandı!');
                                            if (enabledCartLoading.value)
                                              _updateCart(
                                                  increase: true,
                                                  quantity: cartQuantity.value);
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFC2E6E8),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: enabledCartLoading.value
                                                ? Icon(
                                                    Icons.add,
                                                    size: 23,
                                                    color: primaryColor,
                                                  )
                                                : Center(
                                                    child: Container(
                                                      width: 18,
                                                      height: 18,
                                                      child: CircularProgressIndicator(
                                                          strokeWidth: 2,
                                                          valueColor:
                                                              new AlwaysStoppedAnimation<
                                                                      Color>(
                                                                  primaryColor),
                                                          backgroundColor:
                                                              const Color(
                                                                  0xFFC2E6E8)),
                                                    ),
                                                  ),
                                          )),
                                ],
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/page_model/home_page_model.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/models/cart/cart_item_model.dart';
import 'package:hizli_su/pages/widgets/custom_text.dart';
import 'package:hizli_su/pages/widgets/price_text_widget.dart';
import 'package:intl/intl.dart';

class ProductDetailPage extends StatelessWidget {
  final homePageCtrl = Get.find<HomePageModel>();
  int productId;
  RxBool enabledCartLoading = true.obs;
  RxInt cartQuantity = 0.obs;
  var currencyFormat = new NumberFormat("#,##0.00", "tr_TR");

  ProductDetailPage({this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Detayı'),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return GetX<HomePageModel>(initState: (state) async {
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        await homePageCtrl.getProductDetail(productId);
      });
    }, builder: (_) {
      cartQuantity.value = _.getQuantity(productId);
      return _.loading.value
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
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
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  child: Image.memory(base64Decode(
                                      _.product.value.image.content)),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ListTile(
                                  title: Text(
                                    "${_.product.value.name}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 3,
                                  color: primaryColor,
                                ),
                                ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 16.0),
                                    dense: true,
                                    title: Text("Ürün Fiyatı"),
                                    trailing: PriceTextWidget(
                                      price: _.product.value.price,
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
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 16.0),
                                  dense: true,
                                  title: Text("Birim Fiyatı"),
                                  trailing: Text(
                                      "${currencyFormat.format(_.product.value.unitPrice)}  ₺"),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 16.0),
                                  dense: true,
                                  title: Text("Kategori"),
                                  trailing:
                                      Text("${_.product.value.category.name}"),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 16.0),
                                  dense: true,
                                  title: Text("Adet"),
                                  trailing:
                                      Text("x${_.product.value.unitQuantity}"),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 16.0),
                                  dense: true,
                                  title: Text("Marka"),
                                  trailing: Text(
                                      "${_.product.value.manufacturer.name}"),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: homePageCtrl.inCart(_.product.value.id)
                                ? Container(
                                    margin:
                                        EdgeInsets.only(top: 12, bottom: 12),
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
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                      homePageCtrl.inCart(_.product.value.id)
                                          ? Container()
                                          : InkWell(
                                              onTap: () {
                                                print(
                                                    'Sepete ekle + tıklandı!');
                                                if (enabledCartLoading.value)
                                                  _updateCart(
                                                      increase: true,
                                                      quantity:
                                                          cartQuantity.value);
                                              },
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFC2E6E8),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
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
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Card(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(_.product.value?.facility
                                        ?.facilityAttributes[index]?.key ??
                                    'a'),
                                trailing: Text(_.product.value?.facility
                                        ?.facilityAttributes[index]?.value ??
                                    'b'),
                              ),
                              Divider(
                                height: 1,
                              ),
                            ],
                          );
                        },
                        itemCount: _.product.value?.facility?.facilityAttributes
                                ?.length ??
                            0,
                      ),
                    )
                  ],
                ),
              ),
            );
    });
  }

  void _updateCart({bool increase, int quantity}) async {
    enabledCartLoading.value = false;
    var newQuantity = increase ? (quantity + 1) : (quantity - 1);
    var cartItem = new CartItemModel(
        product: homePageCtrl.product.value, cartQuantity: newQuantity);
    await homePageCtrl.addToCart(cartItem);
    await homePageCtrl.getProducts();
    enabledCartLoading.value = true;
    cartQuantity.value = newQuantity;
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/page_model/home_page_model.dart';
import 'package:hizli_su/models/cart/cart_item_model.dart';
import 'package:hizli_su/models/cart/cart_model.dart';
import 'package:hizli_su/pages/widgets/price_text_widget.dart';
import 'package:intl/intl.dart';

class CartItemWidget extends StatefulWidget {
  final Cart cartItem;
  final bool showDivider;
  final bool initialValue;
  final Function(bool value) onCheckedChanged;

  const CartItemWidget(
      {this.cartItem,
      this.showDivider = true,
      this.initialValue = false,
      this.onCheckedChanged});

  @override
  CartItemWidgetState createState() => CartItemWidgetState();
}

class CartItemWidgetState extends State<CartItemWidget> {
  final currencyFormat = new NumberFormat("#,##0.00", "tr_TR");
  bool enabled = true;
  final homePageCtrl = Get.find<HomePageModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CartItemWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _updateCart({bool increase}) async {
    // var warehouseId = Helper.getWarehouseId(context);
    // if (warehouseId > 0) {
    //   var authenticated =
    //       Provider.of<Auth>(context, listen: false).authenticated;
    //
    setState(() {
      enabled = false;
    });

    var newQuantity = increase
        ? (widget.cartItem.quantity + 1)
        : (widget.cartItem.quantity - 1);

    var cartItem = new CartItemModel(
        product: widget.cartItem.product, cartQuantity: newQuantity);
    await homePageCtrl.addToCart(cartItem);
    setState(() {
      enabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => {
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE4E4E4)),
                    color: Colors.white,
                  ),
                  width: 90,
                  height: 100,
                  child: ClipRRect(
                    child: Image.memory(
                        base64Decode(widget.cartItem.product.image.content)),
                  ),
                ),
              ),
              SizedBox(width: 15),
              buildCartInfo(context),
              SizedBox(width: 10),
              buildAddRemoveButtons(context),
            ],
          ),
        ),
        buildDivider()
      ],
    );
  }

  Expanded buildCartInfo(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => {
            },
            child: Text(
              widget.cartItem.product.name,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).accentColor),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '${widget.cartItem.product.manufacturer.name}',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF75759E)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Adet: x${widget.cartItem.product.unitQuantity}',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF75759E)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Birim Fiyatı: ${currencyFormat.format(widget.cartItem.product.unitPrice)}  TL ',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF75759E)),
          ),
          SizedBox(
            height: 5,
          ),
          PriceTextWidget(
              price: widget.cartItem.product.price,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                  fontSize: 16)),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Container buildAddRemoveButtons(BuildContext context) {
    return Container(
      width: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => enabled ? _updateCart(increase: false) : null,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE4E4E4)),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
              ),
              child: Icon(
                Icons.remove,
                size: 15,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          Container(
              child: enabled
                  ? Text(
                      widget.cartItem.quantity.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Theme.of(context).accentColor),
                    )
                  : SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        backgroundColor: Colors.white,
                      ))),
          InkWell(
            onTap: () => enabled ? _updateCart(increase: true) : null,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE4E4E4)),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
              ),
              child: Icon(
                Icons.add,
                size: 15,
                color: Theme.of(context).accentColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDivider() {
    return widget.showDivider
        ? Container(
            margin: EdgeInsets.only(top: 24, bottom: 24),
            height: 1,
            color: const Color(0xFFE4E4E4),
          )
        : Container(
            height: 24,
          );
  }
}

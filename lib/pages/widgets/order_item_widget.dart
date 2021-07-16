import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/page_model/home_page_model.dart';
import 'package:hizli_su/models/cart/cart_item_model.dart';
import 'package:hizli_su/models/cart/cart_model.dart';
import 'package:hizli_su/models/order/order_item.dart';
import 'package:hizli_su/pages/widgets/price_text_widget.dart';
import 'package:intl/intl.dart';

class OrderItemWidget extends StatefulWidget {
  final OrderItem item;
  final bool showDivider;

  const OrderItemWidget(
      {this.item,
      this.showDivider = true});

  @override
  OrderItemWidgetState createState() => OrderItemWidgetState();
}

class OrderItemWidgetState extends State<OrderItemWidget> {
  final currencyFormat = new NumberFormat("#,##0.00", "tr_TR");
  bool enabled = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant OrderItemWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
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
              Container(
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE4E4E4)),
                  color: Colors.white,
                ),
                width: 60,
                height: 70,
                child: ClipRRect(
                  child: Image.memory(
                      base64Decode(widget.item.product.image.content)),
                ),
              ),
              SizedBox(width: 15),
              buildCartInfo(context),
              SizedBox(width: 10),
                Text("Sipariş Miktarı: ${widget.item.quantity}"),
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
          Text(
            widget.item.product.name,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).accentColor),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '${widget.item.product.manufacturer.name} - Adet: x${widget.item.product.unitQuantity}',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF75759E)),
          ),
          SizedBox(
            height: 1,
          ),
          Text(
            'Birim Fiyatı: ${currencyFormat.format(widget.item.product.unitPrice)}  TL ',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF75759E)),
          ),
          SizedBox(
            height: 1,
          ),
          PriceTextWidget(
              price: widget.item.product.price,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                  fontSize: 16)),
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

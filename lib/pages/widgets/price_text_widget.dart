import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:intl/intl.dart';

class PriceTextWidget extends StatelessWidget {
  final double price;
  final TextStyle style;

  PriceTextWidget(
      {this.price,
      this.style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      )});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = new NumberFormat("#,##0.00", "tr_TR");

    var formatted = currencyFormat.format(price).toString().split(',');

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(text: formatted[0], style: style),
        WidgetSpan(
          child: Transform.translate(
            offset: const Offset(0, -3),
            child: Text(
              '.' + formatted[1],
              textScaleFactor: 0.7,
              style: style,
            ),
          ),
        ),
        TextSpan(text: ' ₺', style: style)
      ]),
    );
  }
}

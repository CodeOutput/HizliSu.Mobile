import 'package:flutter/material.dart';

class WhiteBoxWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  WhiteBoxWidget({this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding != null
          ? padding
          : EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
      margin: const EdgeInsets.only(left: 30.0, right: 30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: Helper.buildBorderRadius(),
        boxShadow: [
          BoxShadow(
            color: const Color(0x2200001A),
            spreadRadius: 0,
            blurRadius: 22,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: this.child,
    );
  }
}

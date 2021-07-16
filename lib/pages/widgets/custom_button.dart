import 'package:flutter/material.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/pages/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.all(5),
            primary: primaryColor,
            backgroundColor: primaryColor // foreground
        ),
        onPressed: onPressed,
        child: CustomText(
          text: text,
          color: Colors.white,
          alignment: Alignment.center,
        ));
  }
}

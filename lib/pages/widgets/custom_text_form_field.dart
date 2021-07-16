import 'package:flutter/material.dart';
import 'package:hizli_su/pages/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final bool obscureText;
  final Function onSaved;
  final Function validator;

  CustomTextFormField(
      {this.text,
      this.hint,
      this.obscureText = false,
      this.onSaved,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: onSaved,
            validator: validator,
            obscureText: obscureText,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.black),
                fillColor: Colors.white),
          )
        ],
      ),
    );
  }
}

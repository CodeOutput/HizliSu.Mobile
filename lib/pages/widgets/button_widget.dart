import 'package:flutter/material.dart';

enum ButtonWidgetType { normal, outline }

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final BorderRadius borderRadius;
  final ButtonWidgetType type;
  final bool disabled;

  ButtonWidget(
      {this.text,
      this.onPressed,
      this.borderRadius,
      this.type = ButtonWidgetType.normal,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {

    _buttonPreview(double _height, double _width) {
      final ButtonStyle flatButtonStyle = TextButton.styleFrom(
          minimumSize: Size(_width, _height),
          backgroundColor: Colors.grey,
          shadowColor:  const Color(0xFFE4E4E4),

          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            // borderRadius: borderRadius != null
            //     ? borderRadius
            //     : Helper.buildBorderRadius(),
              side: type == ButtonWidgetType.normal
                  ? BorderSide.none
                  : BorderSide(
                  color: disabled
                      ? const Color(0xFFE4E4E4)
                      : Theme
                      .of(context)
                      .primaryColor,
                  width: 1))
      );
    }
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 44,
      child: TextButton(
        onPressed: () => disabled ? null : onPressed(),
        // textColor: Colors.white,
        child: Text(text,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor)),
      ),
    );
  }
}

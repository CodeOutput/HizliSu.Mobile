import 'package:flutter/material.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CustomAlertMessage {
  static void showAlertMessage(BuildContext context,
      {String title,
      String desc,
      String okText = 'TAMAM',
      Function okButtonPressed,
      AlertType type}) {
    Alert(
      context: context,
      type: type ?? AlertType.info,
      title: "$title",
      desc: "$desc",
      buttons: [
        DialogButton(
          color: primaryColor,
          child: Text(
            "$okText",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: okButtonPressed,
          width: 120,
        )
      ],
    ).show();
  }

  static Future<bool> showAlertMessageWithContent(BuildContext context,
      {String title,
      Widget body,
      String okButtonText,
      Function okButtonPressed,
      String cancelButtonText,
      Function cancelButtonPressed,
      AlertType type}) {
    return Alert(context: context, title: "$title", content: body, buttons: [
      DialogButton(
        onPressed: okButtonPressed,
        color: primaryColor,
        child: Text(
          "$okButtonText",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20),
        ),
      ),
      DialogButton(
        onPressed: cancelButtonPressed,
        color: cancelColor,
        child: Text(
          "$cancelButtonText",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20),
        ),
      ),
    ]).show();
  }
}

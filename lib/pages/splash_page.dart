import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/page_model/splash_page_model.dart';
import 'package:hizli_su/helpers/const.dart';

class SplashPage extends GetWidget<SplashPageModel>  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: primaryColor),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 50.0)),
                    CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFFFFFFFF)),
                      backgroundColor: Color(0xFF00BCD4),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Text("Hızlı Su'ya yönlendiriliyorsunuz...",
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

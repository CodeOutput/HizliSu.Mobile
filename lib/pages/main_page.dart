import 'package:badges/badges.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/page_model/home_page_model.dart';
import 'package:hizli_su/core/page_model/main_page_model.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/pages/cart_page.dart';
import 'package:hizli_su/pages/home_page.dart';
import 'package:hizli_su/pages/order/order_page.dart';
import 'package:hizli_su/pages/setting/setting_page.dart';

class MainPage extends StatelessWidget {
  final MainPageModel controller = Get.find<MainPageModel>();
  final HomePageModel homePageCtrl = Get.find<HomePageModel>();

  GlobalKey _bottomNavigationKey = GlobalKey();
  final pages = [HomePage(), OrderPage(), CartPage(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
        body: SafeArea(child:  getPages(context)),
        bottomNavigationBar: getBottomNavigationBar()));
  }

  Widget getBottomNavigationBar() {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      backgroundColor: Colors.white,
      color: primaryColor,
      buttonBackgroundColor: Color(0xFF26A5B1),
      height: 55,
      animationDuration: Duration(
        milliseconds: 200,
      ),
      index: controller.navigatorValue,
      animationCurve: Curves.easeIn,
      items: <Widget>[
        Icon(Icons.home, size: 30, color: Colors.grey[100]),
        Icon(Icons.redo_outlined, size: 30, color: Colors.grey[100]),
        Badge(
          badgeContent: Text("${homePageCtrl.getCartItemCount}"),
          badgeColor: Colors.lightBlueAccent,
          child: Icon(Icons.shopping_cart, size: 30, color: Colors.grey[100]),
        ),
        Icon(Icons.settings_rounded, size: 30, color: Colors.grey[100]),
      ],
      onTap: (pageIndex) {
        controller.setSelectedValue(pageIndex);
      },
    );
  }

  getPages(BuildContext context) {
    return IndexedStack(
        index: controller.navigatorValue,
        children: pages);
  }
}

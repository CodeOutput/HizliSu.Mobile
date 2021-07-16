import 'package:get/get.dart';
import 'package:hizli_su/core/page_model/cart_page_model.dart';
import 'package:hizli_su/core/page_model/home_page_model.dart';
import 'package:hizli_su/core/page_model/main_page_model.dart';
import 'package:hizli_su/core/page_model/order_page_model.dart';
import 'package:hizli_su/core/page_model/payment_page_model.dart';
import 'package:hizli_su/core/page_model/splash_page_model.dart';

import 'page_model/auth_page_model.dart';

class Binding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AuthPageModel(), fenix: true);
    Get.lazyPut(() => MainPageModel(), fenix: true);
    Get.lazyPut(() => HomePageModel(), fenix: true);
    Get.lazyPut(() => SplashPageModel(), fenix: true);
    Get.lazyPut(() => CartPageModel(), fenix: true);
    Get.lazyPut(() => PaymentPageModel(), fenix: true);
    Get.lazyPut(() => OrderPageModel(), fenix: true);
  }

}
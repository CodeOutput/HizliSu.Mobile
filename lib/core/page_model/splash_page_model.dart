import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hizli_su/core/routes.dart';

class SplashPageModel extends GetxController {
  final box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    redirect();
  }

  void redirect() async {
    try {
      var isSignIn = box.read('accessToken');
      if (isSignIn != null) {
        Timer(Duration(seconds: 3), () => Get.offAllNamed(Routes.mainPage));
      }
      else {
        Timer(Duration(seconds: 3), () => Get.toNamed(Routes.loginPage));
      }
    } catch(e) {
      print('________ERROR___________SplashViewModel___________________');
      print(e.toString());
      print('___________________SplashViewModel________END-ERROR___________');
      Timer(Duration(seconds: 3), () => Get.toNamed(Routes.loginPage));
    }
    update();
  }
}
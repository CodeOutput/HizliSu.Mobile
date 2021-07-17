import 'package:get/get.dart';
import 'package:hizli_su/core/binding.dart';
import 'package:hizli_su/pages/auth/login_page.dart';
import 'package:hizli_su/pages/product/home_page.dart';
import 'package:hizli_su/pages/main_page.dart';
import 'package:hizli_su/pages/splash_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String loginPage = '/login';
  static const String passwordReset = '/password_reset';
  static const String homePage = '/home';
  static const String mainPage = '/main';


  static final List<GetPage> getPages = [
    GetPage(name: splashPage, page: () => SplashPage(), binding: Binding()),
    GetPage(name: loginPage, page: () => LoginPage(), binding: Binding()),
    GetPage(name: mainPage, page: () => MainPage(), binding: Binding()),
    GetPage(name: homePage, page: () => HomePage(), binding: Binding()),
  ];
}

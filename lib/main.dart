import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hizli_su/core/routes.dart';
import 'package:hizli_su/helpers/const.dart';

import 'core/binding.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  //Binding().dependencies();
  runApp(HizliSuApp());
}

class HizliSuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: MaterialColor(0xFF0096AA, color),
      ),
      title: "Hızlı Su",
      getPages: Routes.getPages,
      //başlangıç sayfası
      initialRoute: Routes.splashPage,
      initialBinding: Binding(),
    );
  }
}

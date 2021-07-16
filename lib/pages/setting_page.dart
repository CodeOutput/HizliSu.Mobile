import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hizli_su/core/binding.dart';
import 'package:hizli_su/core/routes.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/pages/address/address_page.dart';
import 'package:hizli_su/pages/auth/login_page.dart';

class SettingPage extends StatelessWidget {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlarım'),
        actions: appBarActions(),
      ),
      body: body(context),
    );
  }

  List<Widget> appBarActions() {
    return [
      // IconButton(
      //   icon: Icon(
      //     Icons.exit_to_app,
      //   ),
      //   onPressed: () {},
      // ),
    ];
  }

  Widget body(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Adreslerim",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: primaryColor,
                  ),
                  onTap: () {
                    Get.to(() => AddressPage(), binding: Binding());
                  },
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  title: Text(
                    "Bilgilendirme",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: primaryColor,
                  ),
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  title: Text(
                    "Profil",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: primaryColor,
                  ),
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  onTap: () {
                    box.erase();
                    Get.to(() => LoginPage(), binding: Binding());
                  },
                  title: Text(
                    "Çıkış Yap",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

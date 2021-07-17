import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/binding.dart';
import 'package:hizli_su/core/page_model/address_page_model.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/helpers/custom_alert_message.dart';
import 'package:hizli_su/models/address/user_address.dart';
import 'package:hizli_su/pages/address/address_detail_page.dart';
import 'package:hizli_su/pages/widgets/custom_button.dart';
import 'package:intl/intl.dart';

class AddressPage extends StatelessWidget {
  final addressPageCtrl = Get.find<AddressPageModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adreslerim'),
        actions: appBarActions(),
      ),
      body: body(context),
      floatingActionButton: FloatingActionButton(
          // isExtended: true,
          child: Icon(Icons.add),
          backgroundColor: primaryColor,
          onPressed: () {
            addressPageCtrl.userAddress.value = new UserAddress();
            Get.to(() => AddressDetailPage(addressId: 0,), binding: Binding());
          }),
    );
  }

  List<Widget> appBarActions() {
    return [
      // IconButton(
      //   icon: Icon(
      //     Icons.exit_to_app,
      //   ),
      //   onPressed: () {
      //   },
      // ),
    ];
  }

  Widget body(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: SingleChildScrollView(
                child: Column(
                  children: addressPageCtrl.userAddresses.value
                      .map(
                        (item) => GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 5),
                            decoration: new BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            "${item.title}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          trailing: IconButton(
                                            onPressed: () {
                                              CustomAlertMessage
                                                  .showAlertMessageWithContent(
                                                context,
                                                title: 'UYARI',
                                                body: Column(
                                                  children: [
                                                    Text(
                                                        'Adres silinecektir. Devam etmek istiyor musunuz ?'),
                                                  ],
                                                ),
                                                okButtonText: 'EVET',
                                                okButtonPressed: () async {
                                                  Get.back();
                                                  await addressPageCtrl
                                                      .deleteAddress(item.id);
                                                  Get.snackbar("Adres durumu",
                                                      "Adres başarıyla silinmiştir!",
                                                      snackPosition:
                                                          SnackPosition.BOTTOM);
                                                  await addressPageCtrl
                                                      .getAuthUserAddressList();
                                                },
                                                cancelButtonText: 'HAYIR',
                                                cancelButtonPressed: () {
                                                  Get.back();
                                                },
                                              );
                                            },
                                            icon: Icon(Icons.delete_forever),
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                        Divider(
                                          height: 1,
                                          thickness: 3,
                                          color: primaryColor,
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0.0, horizontal: 16.0),
                                          dense: true,
                                          title: Text("Eklenme Tarihi"),
                                          trailing: Text(
                                              "${DateFormat("dd.MM.yyyy HH:mm").format(item.creationTime)}"),
                                        ),
                                        Divider(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0.0, horizontal: 16.0),
                                          dense: true,
                                          title: Text("Şehir/İlçe/Mah"),
                                          trailing: Text(
                                              "${item.city.name}/${item.district.name}/${item.neighborhood.name}"),
                                        ),
                                        Divider(
                                          height: 1,
                                          color: Colors.blueGrey,
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0.0, horizontal: 16.0),
                                          dense: true,
                                          title: Text("Sokak/No/Kapı"),
                                          trailing: Text(
                                              "${item.streetName}/${item.no}/${item.doorNumber}"),
                                        ),
                                        Divider(
                                          height: 1,
                                          color: Colors.blueGrey,
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0.0, horizontal: 16.0),
                                          dense: true,
                                          title: Text("Teslimat Telefonu"),
                                          trailing: Text("${item.phoneNumber}"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () async {
                            addressPageCtrl.userAddress.value =
                                new UserAddress();
                            await addressPageCtrl.getAddressDetail(item.id);
                            Get.to(() => AddressDetailPage(addressId: item.id),
                                binding: Binding());
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> _onRefresh() async {
    addressPageCtrl.getAuthUserAddressList();
  }
}

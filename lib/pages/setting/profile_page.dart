import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/page_model/auth_page_model.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/mixins/validation_mixins.dart';
import 'package:hizli_su/pages/widgets/custom_button.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfilePage extends StatelessWidget {
  final authPageCtrl = Get.find<AuthPageModel>();

  ProfilePage();

  var maskFormatter = new MaskTextInputFormatter(
      mask: '### ### ## ##', filter: {"#": RegExp(r'[0-9]')});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Bilgilerim'),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: GetX<AuthPageModel>(initState: (state) {
            authPageCtrl.getAuthUserInfo();
          }, builder: (_) {
            return _.loading.value
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 0),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: null,
                                          initialValue:
                                              authPageCtrl.user.value.name,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                top: 15.0, left: 5, bottom: 8),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[300])),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: primaryColor)),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: primaryColor)),
                                            labelText: 'Ad',
                                            hintText: 'Adınız...',
                                          ),
                                          validator: (String value) {
                                            return ValidationMixins()
                                                .validatorName(value);
                                          },
                                          onSaved: (String value) {
                                            authPageCtrl.user.value.name =
                                                value;
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: null,
                                          initialValue:
                                              authPageCtrl.user.value.surname,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                top: 15.0, left: 5, bottom: 8),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[300])),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: primaryColor)),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: primaryColor)),
                                            labelText: 'Soyad',
                                            hintText: 'Soyadınız...',
                                          ),
                                          validator: (String value) {
                                            return ValidationMixins()
                                                .validatorSurname(value);
                                          },
                                          onSaved: (String value) {
                                            authPageCtrl.user.value.surname =
                                                value;
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: null,
                                          initialValue: authPageCtrl
                                              .user.value.emailAddress,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                top: 15.0, left: 5, bottom: 8),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[300])),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: primaryColor)),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: primaryColor)),
                                            labelText: 'E-posta',
                                            hintText: 'E-posta adresiniz...',
                                          ),
                                          validator: (String value) {
                                            return ValidationMixins()
                                                .validatorEmail(value);
                                          },
                                          onSaved: (String value) {
                                            authPageCtrl.user.value
                                                .emailAddress = value;
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: null,
                                          inputFormatters: [maskFormatter],
                                          initialValue: authPageCtrl
                                              .user.value.phoneNumber,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                top: 15.0, left: 5, bottom: 8),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[300])),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: primaryColor)),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: primaryColor)),
                                            labelText: 'Telefon Numarası',
                                            hintText:
                                                'Telefon numaranızı giriniz...',
                                          ),
                                          validator: (String value) {
                                            return ValidationMixins()
                                                .validatorPhoneNumber(value);
                                          },
                                          onSaved: (String value) {
                                            authPageCtrl
                                                .user.value.phoneNumber = value;
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomButton(
                              text: 'Kaydet',
                              onPressed: () async {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                  authPageCtrl.user.value.isActive = true;
                                  var user = authPageCtrl.user.value;
                                  if ((user?.id ?? 0) > 0) {
                                    var save =
                                        await authPageCtrl.updateUser(user);
                                    Get.snackbar('Form Bilgileri',
                                        'Kayıt başarıyla güncellendi',
                                        snackPosition: SnackPosition.BOTTOM);
                                    await authPageCtrl.getAuthUserInfo();
                                  }
                                  return;
                                } else {
                                  Get.snackbar('Form Bilgileri',
                                      'Zorunlu alanları doldurunuz',
                                      snackPosition: SnackPosition.BOTTOM);
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  );
          }),
        );
  }
}

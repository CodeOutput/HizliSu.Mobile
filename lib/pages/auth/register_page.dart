import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/page_model/auth_page_model.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/mixins/validation_mixins.dart';
import 'package:hizli_su/pages/auth/login_page.dart';
import 'package:hizli_su/pages/widgets/custom_button.dart';
import 'package:hizli_su/pages/widgets/custom_text.dart';
import 'package:hizli_su/pages/widgets/custom_text_form_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterPage extends GetWidget<AuthPageModel> {
  var maskFormatter = new MaskTextInputFormatter(
      mask: '### ### ## ##', filter: {"#": RegExp(r'[0-9]')});
  final formKey = GlobalKey<FormState>();
  final authPageCtrl = Get.find<AuthPageModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginPage());
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
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
                        padding: const EdgeInsets.only(top: 0, bottom: 0),
                        child: Column(
                          children: [
                            CustomText(
                              text: 'Üyelik Formu',
                              color: primaryColor,
                              fontSize: 26,
                              alignment: Alignment.center,
                            ),
                            TextFormField(
                              controller: null,
                              initialValue: authPageCtrl.user.value.name,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 15.0, left: 5, bottom: 8),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[300])),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                disabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                labelText: 'Ad',
                                hintText: 'Adınız...',
                              ),
                              validator: (String value) {
                                return ValidationMixins().validatorName(value);
                              },
                              onSaved: (String value) {
                                authPageCtrl.user.value.name = value;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: null,
                              initialValue: authPageCtrl.user.value.surname,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 15.0, left: 5, bottom: 8),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[300])),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                disabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                labelText: 'Soyad',
                                hintText: 'Soyadınız...',
                              ),
                              validator: (String value) {
                                return ValidationMixins()
                                    .validatorSurname(value);
                              },
                              onSaved: (String value) {
                                authPageCtrl.user.value.surname = value;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: null,
                              initialValue:
                                  authPageCtrl.user.value.emailAddress,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 15.0, left: 5, bottom: 8),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[300])),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                disabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                labelText: 'E-posta',
                                hintText: 'E-posta adresiniz...',
                              ),
                              validator: (String value) {
                                return ValidationMixins().validatorEmail(value);
                              },
                              onSaved: (String value) {
                                authPageCtrl.user.value.emailAddress = value;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: null,
                              initialValue:
                                  authPageCtrl.user.value.userName,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 15.0, left: 5, bottom: 8),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[300])),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                disabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                labelText: 'Kullanıcı Adı',
                                hintText: 'Kullanıcı adınız...',
                              ),
                              validator: (String value) {
                                return ValidationMixins().validatorUserName(value);
                              },
                              onSaved: (String value) {
                                authPageCtrl.user.value.userName = value;
                              },
                            ),
                          SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: null,
                              obscureText: true,
                              initialValue:
                                  authPageCtrl.user.value.password,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 15.0, left: 5, bottom: 8),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[300])),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                disabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                labelText: 'Şifre',
                                hintText: 'Şifreniz...',
                              ),
                              validator: (String value) {
                                return ValidationMixins().validatorPassword(value);
                              },
                              onSaved: (String value) {
                                authPageCtrl.user.value.password = value;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: null,
                              inputFormatters: [maskFormatter],
                              initialValue: authPageCtrl.user.value.phoneNumber,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 15.0, left: 5, bottom: 8),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[300])),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                disabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                labelText: 'Telefon Numarası',
                                hintText: 'Telefon numaranızı giriniz...',
                              ),
                              validator: (String value) {
                                return ValidationMixins()
                                    .validatorPhoneNumber(value);
                              },
                              onSaved: (String value) {
                                authPageCtrl.user.value.phoneNumber = value;
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
                      await authPageCtrl.saveUser(user);
                      if (authPageCtrl.registerResult.value.result.canLogin) {
                        Get.snackbar('Kayıt Durumu', 'Başarıyla üye oldunuz!\nOturum açabilirsiniz',
                            backgroundColor: primaryColor,
                            snackPosition: SnackPosition.BOTTOM);

                       await authPageCtrl.signIn(authPageCtrl.user.value.emailAddress, authPageCtrl.user.value.password);

                        return;
                      }
                      Get.snackbar(
                          'Kayıt Durumu', 'Kayıt esnasında bir hata oluştu!',
                          backgroundColor: Colors.redAccent,
                          snackPosition: SnackPosition.BOTTOM);

                    } else {
                      Get.snackbar(
                          'Kayıt Durumu', 'Zorunlu alanları doldurunuz',
                          backgroundColor: Colors.redAccent,
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

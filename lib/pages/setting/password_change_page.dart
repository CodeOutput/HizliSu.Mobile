import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/page_model/auth_page_model.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/mixins/validation_mixins.dart';
import 'package:hizli_su/pages/widgets/custom_button.dart';
import 'package:hizli_su/pages/widgets/custom_text_form_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PasswordChangePage extends StatelessWidget {
  final authPageCtrl = Get.find<AuthPageModel>();
  String password, newPassword, rnewPassword;

  var maskFormatter = new MaskTextInputFormatter(
      mask: '### ### ## ##', filter: {"#": RegExp(r'[0-9]')});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifre Değiştir'),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GetX<AuthPageModel>(
          initState: (state) {},
          builder: (_) {
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
                                        CustomTextFormField(
                                          obscureText: true,
                                          text: 'Eski Şifre',
                                          hint: '**********',
                                          onSaved: (value) {
                                            password = value;
                                          },
                                          validator: (value) {
                                            if (value.isEmpty ||
                                                value == null) {
                                              return 'Lütfen eski şifrenizi giriniz';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        CustomTextFormField(
                                          obscureText: true,
                                          text: 'Yeni Şifre',
                                          hint: '**********',
                                          onSaved: (value) {
                                            newPassword = value;
                                          },
                                          validator: (value) {
                                            if (value.isEmpty ||
                                                value == null) {
                                              return 'Lütfen yeni şifrenizi giriniz';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        CustomTextFormField(
                                          obscureText: true,
                                          text: 'Yeni Şifre Tekrarı',
                                          hint: '**********',
                                          onSaved: (value) {
                                            rnewPassword = value;
                                          },
                                          validator: (value) {
                                            if (value.isEmpty ||
                                                value == null) {
                                              return 'Lütfen yeni şifrenizi tekrar giriniz';
                                            }
                                            return null;
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
                                  if (newPassword != rnewPassword &&
                                      newPassword != null &&
                                      newPassword.length > 0) {
                                    Get.snackbar('Form Bilgileri',
                                        'Yeni şifre tekrarını hatalı girdiniz!',
                                        backgroundColor: Colors.red,
                                        snackPosition: SnackPosition.BOTTOM);

                                    return;
                                  }

                                  var save = await authPageCtrl.changePassword(
                                      password, newPassword);
                                  if (save) {
                                    Get.snackbar('Form Bilgileri',
                                        'Şifre başarıyla güncellendi',
                                        backgroundColor: primaryColor,
                                        snackPosition: SnackPosition.BOTTOM);
                                  } else {
                                    Get.snackbar('Form Bilgileri',
                                        'Şifre değiştirilemedi!',
                                        backgroundColor: Colors.red,
                                        snackPosition: SnackPosition.BOTTOM);
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/page_model/auth_page_model.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/pages/auth/register_page.dart';
import 'package:hizli_su/pages/widgets/custom_button.dart';
import 'package:hizli_su/pages/widgets/custom_text.dart';
import 'package:hizli_su/pages/widgets/custom_text_form_field.dart';


class LoginPage extends  GetWidget<AuthPageModel>{


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Hoş Geldiniz',
                    fontSize: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=> RegisterPage());
                    },
                    child: CustomText(
                      text: 'Üye ol',
                      color: primaryColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Oturum aç ve devam et...',
                fontSize: 14,
                color: Colors.grey,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: 'E-Posta',
                hint: 'e-posta adresinizi giriniz...',
                onSaved: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Lütfen e-posta adresinizi giriniz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              CustomTextFormField(
                obscureText: true,
                text: 'Şifre',
                hint: '**********',
                onSaved: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Lütfen şifrenizi giriniz';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: 'Şifremi unuttum!',
                fontSize: 14,
                alignment: Alignment.topRight,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Oturum Aç',
                  onPressed: () {
                    print('Oturum Aç clicked');
                    _formKey.currentState.save();
                    print('save clicked');
                    if(_formKey.currentState.validate()) {
                      print('validate clicked');
                      controller.signIn(email, password);
                      print('signIn clicked');
                    }
                    // Get.to(SecondScreen());
                  }),

              SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

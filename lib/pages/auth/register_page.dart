import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/page_model/auth_page_model.dart';
import 'package:hizli_su/pages/auth/login_page.dart';
import 'package:hizli_su/pages/widgets/custom_button.dart';
import 'package:hizli_su/pages/widgets/custom_text.dart';
import 'package:hizli_su/pages/widgets/custom_text_form_field.dart';

class RegisterPage extends GetWidget<AuthPageModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email, password;
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
            child: Icon(Icons.arrow_back, color: Colors.black,)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomText(
                text: 'Üye Ol',
                fontSize: 30,
              ),

              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: 'Adınız',
                hint: '',
                onSaved: (value) {
                  email = value;
                },
                validator: (value) {
                  if(value ==null){
                    print('ERROR');
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: 'E-posta',
                hint: '',
                onSaved: (value) {
                  email = value;
                },
                validator: (value) {
                  if(value ==null){
                    print('ERROR');
                  }
                },
              ),
              SizedBox(height: 40),
              CustomTextFormField(
                text: 'Şifre',
                hint: '**********',
                onSaved: (value) {
                  password = value;
                },
                validator: (value) {
                  if(value ==null) {
                    print('error');
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Kayıt Ol',
                  onPressed: () {
                    _formKey.currentState.save();

                    if(_formKey.currentState.validate())
                      controller.signIn(email,password);
                  }),


            ],
          ),
        ),
      ),
    );
  }
}

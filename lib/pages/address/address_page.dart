import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hizli_su/core/page_model/payment_page_model.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/mixins/validation_mixins.dart';
import 'package:hizli_su/models/address/city.dart';
import 'package:hizli_su/models/address/district.dart';
import 'package:hizli_su/models/address/neighborhood.dart';
import 'package:hizli_su/pages/widgets/cart_footer_widget.dart';
import 'package:hizli_su/pages/widgets/custom_button.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddressPage extends StatelessWidget {
  final paymentPageCtrl = Get.find<PaymentPageModel>();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '### ### ## ##', filter: {"#": RegExp(r'[0-9]')});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adres Detayı'),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
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
                                TextFormField(
                                  controller: null,
                                  initialValue:
                                      paymentPageCtrl.userAddress.value.title,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 15.0, left: 5, bottom: 8),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[300])),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange)),
                                    disabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: primaryColor)),
                                    labelText: 'Adres Başlığı*',
                                    hintText: 'Ev, İş, Diğer ...',
                                  ),
                                  validator: (String value) {
                                    return ValidationMixins()
                                        .validatorTitle(value);
                                  },
                                  onSaved: (String value) {
                                    paymentPageCtrl.userAddress.value.title =
                                        value;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                FractionallySizedBox(
                                  widthFactor: 1,
                                  child: DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(right: 5),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[500])),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepOrange)),
                                      hintText: 'Şehir*',
                                      labelText: 'Şehir*',
                                    ),
                                    value: paymentPageCtrl
                                        .userAddress.value.cityId,
                                    onChanged: (int value) {
                                      paymentPageCtrl.userAddress.value.cityId =
                                          value;
                                      paymentPageCtrl
                                          .userAddress.value.districtId = null;
                                      paymentPageCtrl.userAddress.value
                                          .neighborhoodId = null;
                                      paymentPageCtrl.userAddress.value.cityId =
                                          value;
                                      paymentPageCtrl.neighborhoods.value =
                                          new List<Neighborhood>.empty(
                                              growable: true);
                                      paymentPageCtrl.getDistrictList(value);
                                    },
                                    validator: (int value) {
                                      return ValidationMixins()
                                          .validatorCity(value);
                                    },
                                    onSaved: (int value) {
                                      paymentPageCtrl
                                          .userAddress.value.cityId = value;
                                    },
                                    items: paymentPageCtrl.cities?.value
                                        .map(
                                          (City row) => DropdownMenuItem(
                                            child: Text("${row.name}"),
                                            value: row.id,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                FractionallySizedBox(
                                  widthFactor: 1,
                                  child: DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(right: 5),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[500])),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepOrange)),
                                      hintText: 'İlçe*',
                                      labelText: 'İlçe*',
                                    ),
                                    value: paymentPageCtrl
                                        .userAddress.value.districtId,
                                    onChanged: (int value) {
                                      paymentPageCtrl
                                          .userAddress.value.districtId = value;
                                      paymentPageCtrl
                                          .getNeighborhoodList(value);
                                    },
                                    validator: (int value) {
                                      return ValidationMixins()
                                          .validatorDistrict(value);
                                    },
                                    onSaved: (int value) {
                                      paymentPageCtrl
                                          .userAddress.value.districtId = value;
                                    },
                                    items: paymentPageCtrl.districts?.value
                                        .map(
                                          (District row) => DropdownMenuItem(
                                            child: Text("${row.name}"),
                                            value: row.id,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                FractionallySizedBox(
                                  widthFactor: 1,
                                  child: DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(right: 5),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[500])),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepOrange)),
                                      hintText: 'Mahalle*',
                                      labelText: 'Mahalle*',
                                    ),
                                    value: paymentPageCtrl
                                        .userAddress.value.neighborhoodId,
                                    onChanged: (int value) {
                                      paymentPageCtrl.userAddress.value
                                          .neighborhoodId = value;
                                    },
                                    validator: (int value) {
                                      return ValidationMixins()
                                          .validatorNeighborhood(value);
                                    },
                                    onSaved: (int value) {
                                      paymentPageCtrl
                                          .userAddress.value.neighborhoodId = value;
                                    },
                                    items: paymentPageCtrl.neighborhoods?.value
                                        .map(
                                          (Neighborhood row) =>
                                              DropdownMenuItem(
                                            child: Text("${row.name}"),
                                            value: row.id,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: null,
                                  initialValue:
                                      paymentPageCtrl.userAddress.value.streetName,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 15.0, left: 5, bottom: 8),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[300])),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange)),
                                    disabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: primaryColor)),
                                    labelText: 'Cadde / Sokak*',
                                    hintText: 'Cadde / Sokak ...',
                                  ),
                                  validator: (String value) {
                                    return ValidationMixins()
                                        .validatorStreet(value);
                                  },
                                  onSaved: (String value) {
                                    paymentPageCtrl
                                        .userAddress.value.streetName = value;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: null,
                                        keyboardType: TextInputType.number,
                                        initialValue: paymentPageCtrl
                                            .userAddress.value.no,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 15.0, left: 5, bottom: 8),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey[300])),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.deepOrange)),
                                          disabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: primaryColor)),
                                          labelText: 'No*',
                                          hintText: 'No',
                                        ),
                                        validator: (String value) {
                                          return ValidationMixins()
                                              .validatorNo(value);
                                        },
                                        onSaved: (String value) {
                                          paymentPageCtrl.userAddress.value.no =
                                              value;
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: null,
                                          initialValue: paymentPageCtrl
                                              .userAddress.value.doorNumber,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                top: 15.0, left: 0, bottom: 8),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[300])),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.deepOrange)),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: primaryColor)),
                                            labelText: 'Kapı*',
                                            hintText: 'Kapı',
                                          ),
                                          validator: (String value) {
                                            return ValidationMixins()
                                                .validatorDoorNumber(value);
                                          },
                                          onSaved: (String value) {
                                            paymentPageCtrl.userAddress.value
                                                .doorNumber = value;
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 3,
                      maxLength: 127,
                      initialValue: paymentPageCtrl.userAddress.value.addressDescription,
                      decoration: InputDecoration(
                          labelText: 'Adres Tarifi*',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(new Radius.circular(0.0)))),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                      validator: (String value) {
                        return ValidationMixins().validatorAddressDescription(value);
                      },
                      onSaved: (String value) {
                        paymentPageCtrl.userAddress.value.addressDescription = value;
                      },
                      //controller: host,
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: null,
                      inputFormatters: [maskFormatter],
                      initialValue:
                          paymentPageCtrl.userAddress.value.phoneNumber,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: 15.0, left: 0, bottom: 8),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[300])),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepOrange)),
                        disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        labelText: 'Teslimat Telefonu*',
                        hintText: 'Teslimat Telefonu',
                      ),
                      validator: (String value) {
                        return ValidationMixins().validatorPhoneNumber(value);
                      },
                      onSaved: (String value) {
                        paymentPageCtrl.userAddress.value.phoneNumber = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: 'Kaydet',
                      onPressed: () async {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          paymentPageCtrl.userAddress.value.isActive = true;
                          var userAddress = paymentPageCtrl.userAddress.value;

                          var saveAddress =  await paymentPageCtrl.saveUserAddress(userAddress);
                          if(paymentPageCtrl.userAddress.value.userId>0){
                            Get.snackbar('Form Bilgileri', 'Kayıt başarılı', snackPosition:SnackPosition.BOTTOM );
                            await paymentPageCtrl.getAuthUserAddressList();
                          }

                          return;
                        }else {
                          Get.snackbar('Form Bilgileri', 'Zorunlu alanları doldurunuz', snackPosition:SnackPosition.BOTTOM );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

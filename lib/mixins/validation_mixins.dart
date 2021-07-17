class ValidationMixins {
  String validatorTitle(String value) {
    if (value == null || value == '') {
      return 'Adres başlığı giriniz!';
    }
    return null;
  }

  String validatorStreet(String value) {
    if (value == null || value == '') {
      return 'Cadde / Sokak giriniz!';
    }
    return null;
  }

  String validatorPhoneNumber(String value) {
    if (value == null || value == '') {
      return 'Teslimat telefonu giriniz!';
    }
    return null;
  }

  String validatorAddressDescription(String value) {
    if (value == null || value == '') {
      return 'Adres tarifi  giriniz!';
    }
    return null;
  }

  String validatorDoorNumber(String value) {
    if (value == null || value == '') {
      return 'Kapı numarası giriniz!';
    }
    return null;
  }

  String validatorNo(String value) {
    if (value == null || value == '') {
      return 'Bina numarası giriniz!';
    }
    return null;
  }

  String validatorNeighborhood(int value) {
    if (value == null || value <= 0) {
      return 'Mahalle seçiniz!';
    }
    return null;
  }

  String validatorDistrict(int value) {
    if (value == null || value <= 0) {
      return 'İlçe seçiniz!';
    }
    return null;
  }

  String validatorCity(int value) {
    if (value == null || value <= 0) {
      return 'Şehir seçiniz!';
    }
    return null;
  }

  String validatorName(String value) {
    if (value == null || value == '') {
      return 'Adınızı giriniz!';
    }
    return null;
  }

  String validatorSurname(String value) {
    if (value == null || value == '') {
      return 'Soyadınızı giriniz!';
    }
    return null;
  }

  String validatorEmail(String value) {
    if (value == null || value == '') {
      return 'Eposta adresinizi giriniz!';
    }
    return null;
  }
  String validatorPassword(String value) {
    if (value == null || value == '') {
      return 'Şifrenizi giriniz!';
    }
    return null;
  }

  String validatorPhone(String value) {
    if (value == null || value == '') {
      return 'Telefon numaranızı giriniz!';
    }
    return null;
  }
}

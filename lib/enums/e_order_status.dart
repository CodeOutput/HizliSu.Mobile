enum EOrderStatus {
  OnayBekliyor,
  SiparisinizBirimlerimizeIletilmistir,
  SiparisinizYolaCikmistir,
  TeslimEdilmistir,
  IptalEdildi
}

extension EOrderStatusExtensionList on EOrderStatus {
  static const values = [20, 40, 60, 80, 100];

  int get value => values[this.index];
}

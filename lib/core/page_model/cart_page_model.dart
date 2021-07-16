import 'package:get/get.dart';
import 'package:hizli_su/core/services/cart_service.dart';
import 'package:hizli_su/core/services/home_service.dart';
import 'package:hizli_su/models/cart/cart_item_model.dart';
import 'package:hizli_su/models/cart/cart_model.dart';
import 'package:hizli_su/models/cart/cart_total_model.dart';
import 'package:hizli_su/models/catalog/category_model.dart';
import 'package:hizli_su/models/catalog/product_model.dart';


class CartPageModel extends GetxController {
  RxBool loading = false.obs;
  RxBool cartLoading = true.obs;
  RxList<Cart> cartItems = new List<Cart>.empty(growable: true).obs;


  CartPageModel() {
    // getCartAllList();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
  @override
  void onReady() {
   // getCartAllList();
    super.onReady();
  }

  addToCart(CartItemModel item) async {
    cartLoading.value = false;
    await HomeService().addToCart(item);
    cartLoading.value = true;
    //update();
  }


}

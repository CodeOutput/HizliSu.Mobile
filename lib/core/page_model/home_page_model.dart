import 'package:get/get.dart';
import 'package:hizli_su/core/services/home_service.dart';
import 'package:hizli_su/models/cart/cart_item_model.dart';
import 'package:hizli_su/models/cart/cart_model.dart';
import 'package:hizli_su/models/cart/cart_total_model.dart';
import 'package:hizli_su/models/catalog/category_model.dart';
import 'package:hizli_su/models/catalog/product_model.dart';

class HomePageModel extends GetxController {
  RxBool loadingCategory = false.obs;
  RxBool loading = false.obs;
  RxBool cartLoading = true.obs;
  RxList<Category> categoryList = new List<Category>.empty(growable: true).obs;
  RxList<Product> productList = new List<Product>.empty(growable: true).obs;
  RxList<Cart> cartItems = new List<Cart>.empty(growable: true).obs;

  Rx<Product> product = new Product().obs;
  // Product product = new Product();

  CartTotalModel cartTotalModel = new CartTotalModel();

  bool inCart(int productId) {
    return cartItems.any((e) => e.product.id == productId);
  }

  int get getCartItemCount {
    var count = 0;
    cartItems.forEach((element) {
      count += element.quantity;
    });
    return count;
  }

  double get getCartTotal {
    double _cartTotal = 0;

    cartItems.forEach((item) {
      _cartTotal += (item.product.price * item.quantity);
    });

    return _cartTotal;
  }

  int getQuantity(int productId) {
    if (this.cartItems.any((element) => element.product.id == productId)) {
      return this
          .cartItems
          .where((element) => element.product.id == productId)
          .elementAt(0)
          .quantity;
    } else {
      return 0;
    }
  }

  HomePageModel() {
    // getCategory();
    getProducts();
    getCartAllList();
  }

  getCategory() async {
    loadingCategory.value = true;
    var value = await HomeService().getCategoryListAsync();
    categoryList.value = value.result.items;
    loadingCategory.value = false;
  }

  getProducts() async {
    loading.value = true;
    var value = await HomeService().getProductListAsync();
    productList.value = value.result.items;
    loading.value = false;
  }

  getProductDetail(int productId) async {
    loading.value = true;
    var value = await HomeService().getProductDetailAsync(productId);
    product.value = value.result;
    loading.value = false;
  }

  addToCart(CartItemModel item) async {
    cartLoading.value = false;
    await HomeService().addToCart(item);

    await getCartAllList();
    cartLoading.value = true;
  }

  getCartList() async {
    loading.value = true;
    var value = await HomeService().getCartList();
    cartItems.value = value.result.items;
    loading.value = false;
  }

  getCartAllList() async {
    ///loading.value = true;
    var value = await HomeService().getCartAllList();
    cartItems.value = value.result.items;
    // loading.value = false;
  }
}

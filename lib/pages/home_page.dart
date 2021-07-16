import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hizli_su/core/binding.dart';
import 'package:hizli_su/core/page_model/home_page_model.dart';
import 'package:hizli_su/helpers/const.dart';
import 'package:hizli_su/models/catalog/product_model.dart';
import 'package:hizli_su/pages/auth/login_page.dart';
import 'package:hizli_su/pages/widgets/custom_text.dart';
import 'package:hizli_su/pages/widgets/product.dart';

class HomePage extends StatelessWidget {
  final box = GetStorage();
  var scController = new ScrollController();
  final HomePageModel controller = Get.find<HomePageModel>();
 // final CartPageModel cartCtrl = Get.find<CartPageModel>();

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        // appBar: AppBar(
        //   title: Text('Anasayfa'),
        //   actions: _appBarActions(),
        // ),
        body: Obx(() =>RefreshIndicator(
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                children: [
                  //_searchTextFormField(),
                  // SizedBox(
                  //   height: 0,
                  // ),
                  // CustomText(
                  //   text: "Kategoriler",
                  //   fontSize: 20,
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                 // Text("${controller.loadingCategory.value}"),
                  controller.loadingCategory.value
                      ? Center(child: CircularProgressIndicator())
                      : _listViewCategory(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Ürünler",
                        fontSize: 18,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _listViewProducts(context),
                ],
              ),
            ),
          ),
        )),
      );

  }

  Future<void> _onRefresh() async {
    controller.getCategory();
    controller.getProducts();
    controller.getCartAllList();
  }
  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    if (controller.loading.value) {
      return CircularProgressIndicator(
          strokeWidth: 2,
          valueColor:
          new AlwaysStoppedAnimation<
              Color>(
              Colors.white),
          backgroundColor:
          primaryColor);
    }
    return Container(
      height: 100,
      child: ListView.separated(
        itemCount: controller.categoryList.value.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade100, //color[50],
                ),
                height: 65,
                width: 65,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Image.memory(base64Decode(
                      controller.categoryList.value[index].image
                          .content)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              CustomText(
                text: controller.categoryList.value[index].name,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) =>
            SizedBox(
              width: 5,
            ),
      ),
    );
  }

  List _buildItems(List<Product> products, BuildContext context) {
    var _staggeredTiles = new List<StaggeredTile>.empty(growable: true);
    var _widgets = new List<Widget>.empty(growable: true);

    products.forEach((item) {
      _staggeredTiles.add(new StaggeredTile.count(1, 1.5));
      //item.cartLoading = true;
      _widgets.add(ProductWidget(
        product: item,
      ));
    });

    return [_staggeredTiles, _widgets];
  }

  Widget _listViewProducts(BuildContext context) {
    if (controller.loading.value) {
      return CircularProgressIndicator(
          strokeWidth: 2,
          valueColor:
          new AlwaysStoppedAnimation<
              Color>(
              Colors.white),
          backgroundColor:
          primaryColor);
    }
    var items = _buildItems(controller.productList.value, context);
    var _staggeredTiles = items[0];
    var _tiles = items[1];
    return Stack(

      children: [
        //   _listViewCategory(),
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Container(
            child: StaggeredGridView.countBuilder(
              padding: EdgeInsets.only(left: 5, right: 5, top: 5),
              crossAxisCount: 2,
              controller: this.scController,
              staggeredTileBuilder: (index) {
                return _staggeredTiles[index];
              },
              itemBuilder: (context, index) {
                return _tiles[index];
              },
              //staggeredTiles: _staggeredTiles,
              //children: _tiles,
              itemCount: controller.productList.value.length,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
            ),
          ),
        ),
      ],
    );
}

//
// Widget _listViewProducts() {
//   return GetBuilder<HomePageModel>(
//     builder: (controller) => Container(
//       height: 350,
//       child: ListView.separated(
//         itemCount: controller.productModel.result.items.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               // Get.to(DetailsView(
//               //   model: controller.productModel[index],
//               // ));
//             },
//             child: Container(
//               width: MediaQuery.of(context).size.width * .4,
//               child: Column(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.grey.shade100,
//                     ),
//                     child: Container(
//                         height: 220,
//                         width: MediaQuery.of(context).size.width * .4,
//                         child: Image.memory(base64Decode(controller.productModel.result.items[index].image.content))),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   CustomText(
//                     text: controller.productModel.result.items[index].name,
//                     alignment: Alignment.bottomLeft,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Expanded(
//                     child: CustomText(
//                       text: controller.productModel?.result?.items[index]?.description??'',
//                       color: Colors.grey,
//                       alignment: Alignment.bottomLeft,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   CustomText(
//                     text: controller.productModel.result.items[index].price.toString() +
//                         " \TL",
//                     color: primaryColor,
//                     alignment: Alignment.bottomLeft,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//         separatorBuilder: (context, index) => SizedBox(
//           width: 10,
//         ),
//       ),
//     ),
//   );
// }
//


List<Widget> _appBarActions() {
  return [
    IconButton(
      icon: Icon(
        Icons.exit_to_app,
      ),
      onPressed: () {
        box.erase();
        //Get.toNamed(Routes.loginPage);
        // Get.toNamed(Routes.loginPage);
        Get.to(() => LoginPage(), binding: Binding());
      },
    ),
  ];
}

}


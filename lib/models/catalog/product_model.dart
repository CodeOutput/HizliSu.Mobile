import 'package:hizli_su/models/general/image_model.dart';

import 'category_model.dart';
import 'facility_model.dart';
import 'manufacturer_model.dart';

class Product {
  int categoryId;
  Category category;
  int manufacturerId;
  Manufacturer manufacturer;
  int facilityId;
  Facility facility;
  String name;
  String description;
  String sellerCode;
  String barcode;
  int stockQuantity;
  int unitQuantity;
  double unitPrice;
  double price;
  bool published;
  int imageId;
  Image image;
  String lastModificationTime;
  int lastModifierUserId;
  String creationTime;
  int creatorUserId;
  int id;
  bool cartLoading = true;
  Product(
      {this.categoryId,
      this.category,
      this.manufacturerId,
      this.manufacturer,
      this.facilityId,
      this.facility,
      this.name,
      this.description,
      this.sellerCode,
      this.barcode,
      this.stockQuantity,
      this.unitQuantity,
      this.unitPrice,
      this.price,
      this.published,
      this.imageId,
      this.image,
      this.lastModificationTime,
      this.lastModifierUserId,
      this.creationTime,
      this.creatorUserId,
      this.id,
      this.cartLoading = true});

  Product.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    manufacturerId = json['manufacturerId'];
    manufacturer = json['manufacturer'] != null
        ? new Manufacturer.fromJson(json['manufacturer'])
        : null;
    facilityId = json['facilityId'];
    facility = json['facility'] != null
        ? new Facility.fromJson(json['facility'])
        : null;
    name = json['name'];
    description = json['description'];
    sellerCode = json['sellerCode'];
    barcode = json['barcode'];
    stockQuantity = json['stockQuantity'];
    unitQuantity = json['unitQuantity'];
    unitPrice = json['unitPrice'];
    price = json['price'];
    published = json['published'];
    imageId = json['imageId'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    lastModificationTime = json['lastModificationTime'];
    lastModifierUserId = json['lastModifierUserId'];
    creationTime = json['creationTime'];
    creatorUserId = json['creatorUserId'];
    id = json['id'];
    cartLoading = true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['manufacturerId'] = this.manufacturerId;
    if (this.manufacturer != null) {
      data['manufacturer'] = this.manufacturer.toJson();
    }
    data['facilityId'] = this.facilityId;
    if (this.facility != null) {
      data['facility'] = this.facility.toJson();
    }
    data['name'] = this.name;
    data['description'] = this.description;
    data['sellerCode'] = this.sellerCode;
    data['barcode'] = this.barcode;
    data['stockQuantity'] = this.stockQuantity;
    data['unitQuantity'] = this.unitQuantity;
    data['unitPrice'] = this.unitPrice;
    data['price'] = this.price;
    data['published'] = this.published;
    data['imageId'] = this.imageId;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}

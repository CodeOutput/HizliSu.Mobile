import 'package:hizli_su/models/catalog/product_result_model.dart';
import 'package:hizli_su/models/general/image_model.dart';

class Manufacturer {
  String name;
  String description;
  Image image;
  int imageId;
  int sortOrder;
  String lastModificationTime;
  int lastModifierUserId;
  String creationTime;
  int creatorUserId;
  int id;

  Manufacturer(
      {this.name,
        this.description,
        this.image,
        this.imageId,
        this.sortOrder,
        this.lastModificationTime,
        this.lastModifierUserId,
        this.creationTime,
        this.creatorUserId,
        this.id});

  Manufacturer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    imageId = json['imageId'];
    sortOrder = json['sortOrder'];

    lastModificationTime = json['lastModificationTime'];
    lastModifierUserId = json['lastModifierUserId'];
    creationTime = json['creationTime'];
    creatorUserId = json['creatorUserId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['image'] = this.image;
    data['imageId'] = this.imageId;
    data['sortOrder'] = this.sortOrder;
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}
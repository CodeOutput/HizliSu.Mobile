
class Image {
  String userFileName;
  String fileName;
  String contentType;
  int length;
  String content;
  String lastModificationTime;
  int lastModifierUserId;
  String creationTime;
  int creatorUserId;
  int id;

  Image(
      {this.userFileName,
        this.fileName,
        this.contentType,
        this.length,
        this.content,
        this.lastModificationTime,
        this.lastModifierUserId,
        this.creationTime,
        this.creatorUserId,
        this.id});

  Image.fromJson(Map<String, dynamic> json) {
    userFileName = json['userFileName'];
    fileName = json['fileName'];
    contentType = json['contentType'];
    length = json['length'];
    content = json['content'];
    lastModificationTime = json['lastModificationTime'];
    lastModifierUserId = json['lastModifierUserId'];
    creationTime = json['creationTime'];
    creatorUserId = json['creatorUserId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userFileName'] = this.userFileName;
    data['fileName'] = this.fileName;
    data['contentType'] = this.contentType;
    data['length'] = this.length;
    data['content'] = this.content;
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}
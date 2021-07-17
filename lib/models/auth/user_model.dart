class User {
  String userName;
  String name;
  String surname;
  String emailAddress;
  String phoneNumber;
  bool isActive;
  String fullName;
  String lastLoginTime;
  String creationTime;
  List<String> roleNames;
  int id;

  User(
      {this.userName,
        this.name,
        this.surname,
        this.emailAddress,
        this.phoneNumber,
        this.isActive,
        this.fullName,
        this.lastLoginTime,
        this.creationTime,
        this.roleNames,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    name = json['name'];
    surname = json['surname'];
    emailAddress = json['emailAddress'];
    phoneNumber = json['phoneNumber'];
    isActive = json['isActive'];
    fullName = json['fullName'];
    lastLoginTime = json['lastLoginTime'];
    creationTime = json['creationTime'];
    // roleNames = json['roleNames'].cast<String>();
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['emailAddress'] = this.emailAddress;
    data['phoneNumber'] = this.phoneNumber;
    data['isActive'] = this.isActive;
    data['fullName'] = this.fullName;
    data['lastLoginTime'] = this.lastLoginTime;
    data['creationTime'] = this.creationTime;
    data['roleNames'] = this.roleNames;
    data['id'] = this.id;
    return data;
  }
}
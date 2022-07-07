class UserModel {
  String? uid;
  String? email;
  String? password;
  String? name;
  String? phone;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json)
  {
    uid = json['uid'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String,dynamic> toMap()
  {
    return {
      'uid':uid,
      'email':email,
      'name':name,
    'password':password,
      'phone':phone,

    };
  }

}
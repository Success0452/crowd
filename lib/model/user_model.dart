class UserModel {
  String name;
  String email;
  String phone;
  String link;

  UserModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.link});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        link: json['link']);
  }
}

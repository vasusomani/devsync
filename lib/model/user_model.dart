class UserModel {
  String? id;
  String? name;
  String? username;
  String? email;
  String? plan;
  String? password;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.plan,
    this.password,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['userData']['_id'],
      name: json['userData']['name'],
      username: json['userData']['username'],
      email: json['userData']['email'],
      plan: json['userData']['plan'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}

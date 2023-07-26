class User {
  int? id;
  String? userId;
  String? password;

  User({
    this.id = 0,
    this.userId,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['password'] = this.password;
    return data;
  }
}

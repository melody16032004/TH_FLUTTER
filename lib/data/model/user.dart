class User {
  String? fullname;
  String? email;
  String? gender;
  String? favourite;

  User({this.fullname, this.email, this.gender, this.favourite});
  User.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    gender = json['gender'];
    favourite = json['favourite'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = fullname;
    data['email'] = email;
    data['gender'] = gender;
    data['favourite'] = favourite;
    return data;
  }
}

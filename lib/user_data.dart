class UserData {
  String name;
  String email;
  String password;
  UserData(this.name, this.email, this.password);

  factory UserData.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return UserData(json["name"], json["email"], json["password"]);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "password": password};
  }
}

class User {
  dynamic id;
  String? imageUri, membershipNo, name, email, phone, role, gender, status, job;
  dynamic imageData;
  dynamic points;
  User();

  User.create({
    this.id,
    this.name,
    this.imageUri,
    this.email,
    this.phone,
    this.role,
    this.gender,
    this.status,
    this.job,
    this.points,
    this.membershipNo,
  });

  factory User.fromJson(Map<String, dynamic> user) {
    return User.create(
        id: user['id'],
        name: user['name'],
        imageUri: user['profile_pic'],
        email: user['email'],
        phone: user['phone'],
        role: user['role'],
        gender: user['customer'],
        status: user['status'],
        job: user['job'],
        points: user['points'],
        membershipNo: user['membership_no']);
  }
//name phone email compulsory
  Map<String, dynamic> toJson() {
    var user = {
      "name": this.name,
      "email": this.email,
      "gender": this.gender,
      "job": this.job,
    };
    if (this.imageData != null) {
      user["profile_pic"] = this.imageData;
    }
    if (this.phone != null) {
      user["phone"] = this.phone;
    }
    return user;
  }
}

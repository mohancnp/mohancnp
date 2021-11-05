class User {
  dynamic id;
  String? imageUri, membershipNo, name, email, phone, role, gender, status, job;
  dynamic points;
  User();

  User.create(
      {this.id,
      this.name,
      this.imageUri,
      this.email,
      this.phone,
      this.role,
      this.gender,
      this.status,
      this.job,
      this.points,
      this.membershipNo});

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
}

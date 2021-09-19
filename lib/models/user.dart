class Client {
  int id;
  String? imageUri,membershipNo, name, email, phone, role, gender, status, job;

  Client(
      {required this.id,
      required this.name,
      required this.imageUri,
      required this.email,
      required this.phone,
      required this.role,
      required this.gender,
      required this.status,
      required this.job,
      required this.membershipNo});

  factory Client.fromJson(Map<String, dynamic> client) {
    return Client(
        id: client['id'],
        name: client['name'],
        imageUri: client['profile_pic'],
        email: client['email'],
        phone: client['phone'],
        role: client['role'],
        gender: client['customer'],
        status: client['status'],
        job: client['job'],
        membershipNo: client['membership_no']);
  }
}

class User {
  String name, email, password, passwordConfirmation, phone;

  User(this.name, this.email, this.password, this.passwordConfirmation,
      this.phone);

  Map<String, dynamic> toJson() {
    var newUserData = {
      "name": this.name,
      "email": this.email,
      "password": this.password,
      "password_confirmation": this.passwordConfirmation,
      "phone": this.phone
    };
    return newUserData;
  }
}

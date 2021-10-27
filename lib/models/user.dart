class Client {
  dynamic id;
  String? imageUri, membershipNo, name, email, phone, role, gender, status, job;
  dynamic points;

  Client.update(this.name, this.email);

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
      this.points,
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
        points: client['points'],
        membershipNo: client['membership_no']);
  }

  Map<String, dynamic> jsonToUpdate() {
    var newUserData = {
      "name": this.name,
      "email": this.email,
      "job": this.job,
      "gender": this.gender,
      "profile_pic": this.imageUri,
    };
    if (this.job == null) {
      newUserData.remove("job");
    }
    if (this.gender == null) {
      newUserData.remove("gender");
    }

    return newUserData;
  }
}

class User {
  String name, email, job, gender, provider, providerId;
  String? password, passwordConfirmation, phone;

  User(this.name, this.email, this.password, this.passwordConfirmation,
      this.phone, this.job, this.gender, this.provider, this.providerId);

  Map<String, dynamic> toJson() {
    var newUserData = {
      "name": this.name,
      "email": this.email,
      "job": this.job,
      "gender": this.gender,
      "provider": this.provider,
      "provider_id": this.providerId
    };
    return newUserData;
  }
}

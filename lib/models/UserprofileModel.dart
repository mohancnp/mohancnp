import 'dart:convert';

import 'package:flutter/material.dart';

class UserProfile {
  int? id;
  String? name, profilepic, email, phone, emailverifiedat, deletedat,
  createdat, updatedat, role, gender, status, job, membershipnumber;

  UserProfile(
      {this.id, this.name, this.profilepic, this.email, this.phone, this.emailverifiedat,
        this.deletedat, this.createdat, this.updatedat, this.role,
        this.gender, this.status, this.job, this.membershipnumber});

  factory UserProfile.fromJson(Map<String, dynamic> data) {

    var _user = UserProfile(
      id: data['id'],
      name: data['name'],
      profilepic: data["profile_pic"],
    email: data['email'],
    phone: data['phone'],
    emailverifiedat: data['email_verified_at'],
    deletedat: "deleted_at",
    createdat: "created_at",
    updatedat: data['updated_at'],
    role: data["role"],
    gender: data["gender"],
    status: data["status"],
    job: data["job"],
        membershipnumber: data["membership_no"],);

    return _user;
  }

  factory UserProfile.fromDB(Map<String, dynamic> data) {
    return UserProfile(
      id: data['uid'],
      name: data['email'],
    profilepic: data['image'],
    email: data['name'],
    phone: data['type'],
    emailverifiedat: data['authToken'],
    deletedat: data["minToday"],
    createdat: data["minToday"],
    updatedat:data["minToday"],
    role: data["badgeLevel"],
    gender: data["meditationDay"],
    status: data["minToday"],
    job: data["minToday"],
    membershipnumber: data["minToday"],
    );
  }

}

class UserProfileModel {
  int? id;
  String? name;
  String? profilepic;
  String? email;
  String? phone;
  String? emailverifiedat;
  String? deletedat;
  String? createdat;
  String? updatedat;
  String? role;
  String? gender;
  String? status;
  String? job;
  String? membershipnumber;
  UserProfileModel(
      {this.id,
        this.name,
        this.profilepic,
        this.email,
        this.phone,
        this.emailverifiedat,
        this.deletedat,
        this.createdat,
        this.updatedat,
        this.role,
        this.gender,
        this.status,
        this.job,
        this.membershipnumber,
      });

  UserProfileModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilepic = json['profile_pic'];
    email = json['email'];
    phone = json['phone'];
    emailverifiedat = json['email_verified_at'];
    deletedat = json['deleted_at'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
    role = json['role'];
    gender = json['gender'];
    status = json['status'];
    job = json['job'];
    membershipnumber = json['membership_no'];

  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profile_pic'] = this.profilepic;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailverifiedat;
    data['deleted_at'] = this.deletedat;
    data['created_at'] = this.createdat;
    data['updated_at'] = this.updatedat;
    data['role'] = this.role;
    data['gender'] = this.gender;
    data['status'] = this.status;
    data['job'] = this.job;
    data['membership_no'] = this.membershipnumber;
    return data;
  }
}
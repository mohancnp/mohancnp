import 'dart:io';
import 'package:dio/dio.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/services/older/profile_service/profile_service.dart';
import 'package:metrocoffee/core/services/storage/db/core.dart';
import 'package:metrocoffee/core/services/storage/db/dbconst.dart';
import 'package:metrocoffee/core/sources/source_impl/remote_source_impl.dart';

/* to be modifed with new auth api later, unused now*/

class ProfileServiceImpl extends ProfileService {
  @override
  Future getUserDetail() async {
    var remoteSource = RemoteSourceImpl();
    try {
      var profile = await remoteSource.get('/api/profile');
      return profile;
    } on ServerException {
      throw AppException();
    }
  }

  @override
  Future changeUserPassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  }) async {
    var remoteSource = RemoteSourceImpl();
    try {
      var data = {
        "current_password": currentPassword,
        "new_password": newPassword,
        "new_password_confirmation": passwordConfirmation
      };

      var passwordStatus =
          await remoteSource.post('/api/profile/change-password', body: data);

      return passwordStatus;
    } on ServerException {
      throw AppException();
    }
  }

  @override
  Future updateProfile(
      {required final Map<String, dynamic> profileData,
      File? imageData}) async {
    var remoteSource = RemoteSourceImpl();
    var newMap = FormData.fromMap(profileData);
    if (imageData != null) {
      var image =
          await MultipartFile.fromFile(imageData.path, filename: "image.png");
      // profileData["profile_pic"] = null;
      // profileData.update("profile_pic", (value) => image);
      newMap = FormData.fromMap({
        "name": profileData["name"],
        "email": profileData["email"],
        "profile_pic": image,
      });
    }

    try {
      var afterUpdate = await remoteSource.put(
        '/api/profile/update',
        body: newMap,
      );

      if (afterUpdate is Map<String, dynamic>) {
        return afterUpdate;
      }
      return {'data': afterUpdate};
    } on ServerException {
      throw AppException();
    }

    // throw UnimplementedError();
  }

  @override
  Future updateDbUser(Map<String, dynamic> user) async {
    var db = locator<DbStorage>().db;

    try {
      var data = await db.query(Table.cart,
          columns: [UserField.userId, UserField.name],
          where: '${UserField.userId}= ?',
          whereArgs: [user[UserField.userId]]);
      Object count;
      if (data.isNotEmpty) {
        //update
        count = db.update(Table.cart, user);
      } else {
        //insert
        count = await db.insert(Table.cart, user);
      }
      return count;
    } on Exception {
      throw (AppException());
    }
  }
}

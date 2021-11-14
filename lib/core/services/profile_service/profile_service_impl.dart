import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/services/profile_service/profile_service.dart';
import 'package:metrocoffee/core/services/storage/db/core.dart';
import 'package:metrocoffee/core/services/storage/db/dbfeilds.dart';
import 'package:metrocoffee/core/sources/source_impl/remote_source_impl.dart';

import '../../config.dart';
import '../../locator.dart';

class ProfileServiceImpl extends ProfileService {
  @override
  Future getUserDetail() async {
    var remoteSource = RemoteSourceImpl();
    try {
      var profile = await remoteSource.get('$baseUrl/api/profile');
      return profile;
    } on ServerException catch (e) {
      print("${e.code}: ${e.message}");
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

      var passwordStatus = await remoteSource
          .post('$baseUrl/api/profile/change-password', body: data);
      // print(passwordStatus);
      return passwordStatus;
    } on ServerException catch (e) {
      print("${e.code}: ${e.message}");
      throw AppException();
    }
  }

  @override
  Future updateProfile({required Map<String, dynamic> profileData}) async {
    var remoteSource = RemoteSourceImpl();

    try {
      var afterUpdate = await remoteSource.put('$baseUrl/api/profile/update',
          body: profileData);

      if (afterUpdate is Map<String, dynamic>) {
        return afterUpdate;
      }
      return {'data': afterUpdate};
    } on ServerException catch (e) {
      print("${e.code}: ${e.message}");
      throw AppException();
    }

    // throw UnimplementedError();
  }

  @override
  Future updateDbUser(Map<String, dynamic> user) async {
    var db = locator<DbStorage>().db;

    try {
      var data = await db.query(Table.cart,
          columns: [UserFeild.userId, UserFeild.name],
          where: '${UserFeild.userId}= ?',
          whereArgs: [user[UserFeild.userId]]);
      var count;
      if (data.length > 0) {
        //update
        count = db.update(Table.cart, user);
      } else {
        //insert
        count = await db.insert(Table.cart, user);
      }
      return count;
    } on Exception catch (e) {
      print("add/update user error $e");
      throw (AppException());
    }
  }
}

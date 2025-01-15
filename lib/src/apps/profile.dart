import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/rest_params.dart';

/// ProfileApp APIs
class ProfileApp {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String app = Constants.app;

  /// Get User Detail
  Future<APIResult> getUserDetail() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/Profile',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get user media
  Future<APIResult> getUserMedia() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/Profile/GetMedia',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update Username
  Future<APIResult> updateUsername(Object data) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$app/Profile/UpdateUsername',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update Profile Picture
  Future<APIResult> updateProfilePicture(Object data) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$app/Profile/UpdateProfilePicture',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update Profile Cover
  Future<APIResult> updateProfileCover(Object data) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$app/Profile/UpdateProfileCover',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Change Email
  Future<APIResult> changeEmail(String email) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$app/Profile/ChangeEmail',
          data: email,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  // Change Password
  Future<APIResult> changePassword(
      String id, String password, String currentPassword) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$app/Profile/ChangeEmail',
          data: {
            'CurrentPassword': currentPassword,
            'Password': password,
            'Id': id,
          },
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get User Profile
  Future<APIResult> getUserProfile() async {
    try {
      var res = await Rest.get(
        RestParams(
          '/$apiraiser/$version/$app/Profile/UserProfile',
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Insert User Profile
  Future<APIResult> insertUserProfile(Object data) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$app/Profile/UserProfile',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Update User Profile
  Future<APIResult> updateUserProfile(Object data) async {
    try {
      var res = await Rest.put(
        RestParams(
          '/$apiraiser/$version/$app/Profile/UserProfile',
          data: data,
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

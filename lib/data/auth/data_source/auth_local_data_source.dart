// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:synapsis_challenge/core/res/reference.dart';
import 'package:synapsis_challenge/data/user/model/user_model.dart';

import '../../../core/error/exception.dart';
import '../../../core/res/error_constants.dart';
import '../../user/dao/user_dao.dart';

abstract class AuthDataSource {
  Future<void> registerUser(UserModel user);
  Future<UserModel> loginUser(String email, String password);
  Future<UserModel> checkAuth();
  Future<UserModel> loginNFC(Map nfc);
  Future<bool> logout();
}

class AuthDataSourceImpl implements AuthDataSource {
  final UserDao userDao;
  final SharedPreferences sharedPreferences;

  AuthDataSourceImpl({
    required this.userDao,
    required this.sharedPreferences,
  });

  @override
  Future<void> registerUser(UserModel user) async {
    try {
      final userData = await userDao.getUserByEmail(user.email);

      if (userData != null) {
        throw CustomException(message: ErrorConstants.EMAIL_EXISTS);
      }
      await sharedPreferences.setString(userEmail, user.email);
      return userDao.insertUser(user);
    } on CustomException {
      rethrow;
    } on Exception catch (e) {
      log("[Error] AuthDataSourceImpl registerUser $e");
      throw CustomException(message: ErrorConstants.REGISTRATION_FAILED);
    }
  }

  @override
  Future<UserModel> loginUser(String email, String password) async {
    try {
      final user = await userDao.getUserByEmail(email);
      if (user == null) {
        throw CustomException(message: ErrorConstants.USER_NOT_FOUND);
      }
      final result = await userDao.getUserByEmailAndPassword(email, password);
      if (result != null) {
        await sharedPreferences.setString(userEmail, user.email);
        return result;
      } else {
        throw CustomException(message: ErrorConstants.WRONG_PASSWORD);
      }
    } on CustomException {
      rethrow;
    } on Exception catch (e) {
      log("[Error] AuthDataSourceImpl loginUser $e");
      throw CustomException(message: ErrorConstants.LOGIN_FAILED);
    }
  }

  @override
  Future<UserModel> checkAuth() async {
    String? email = sharedPreferences.getString(userEmail);
    if (email == null) {
      throw CustomException(message: ErrorConstants.UNAUTHENTICATED);
    }
    final user = await userDao.getUserByEmail(email);
    if (user == null) {
      throw CustomException(message: ErrorConstants.USER_NOT_FOUND);
    }
    if (user.authExpiredDate.isBefore(DateTime.now())) {
      throw CustomException(message: ErrorConstants.AUTHENTICATION_EXPIRED);
    }
    return user;
  }

  @override
  Future<UserModel> loginNFC(Map nfc) async {
    String nfcData = jsonEncode(nfc);

    var userData = await userDao.getUserByEmail("nfc_$nfcData");
    if (userData == null) {
      userData = UserModel.userNfc.copyWith(email: "nfc_$nfcData");
      userDao.insertUser(userData);
    }
    await sharedPreferences.setString(userEmail, userData.email);
    return userData;
  }

  @override
  Future<bool> logout() async {
    await sharedPreferences.remove(userEmail);
    return true;
  }
}

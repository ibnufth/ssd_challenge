import 'dart:developer';

import 'package:get/get.dart';
import 'package:synapsis_challenge/core/error/failure.dart';
import 'package:synapsis_challenge/data/user/model/user_model.dart';

import '../../../core/error/exception.dart';
import '../../../core/res/error_constants.dart';
import '../../user/dao/user_dao.dart';

abstract class AuthDataSource {
  Future<void> registerUser(UserModel user);
  Future<UserModel> loginUser(String email, String password);
}

class AuthDataSourceImpl extends GetxService implements AuthDataSource {
  final UserDao userDao;

  AuthDataSourceImpl({required this.userDao});

  @override
  Future<void> registerUser(UserModel user) async {
    try {
      final userData = await userDao.getUserByEmail(user.email);
      if (userData != null) {
        throw CustomException(message: ErrorConstants.EMAIL_EXISTS);
      }
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
}

import 'package:get/get.dart';
import 'package:synapsis_challenge/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:synapsis_challenge/data/auth/data_source/auth_local_data_source.dart';
import 'package:synapsis_challenge/data/user/model/user_model.dart';
import 'package:synapsis_challenge/domain/auth/repository/auth_repository.dart';
import 'package:synapsis_challenge/domain/user/entity/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSourceImpl;

  AuthRepositoryImpl({AuthDataSource? authDataSourceImpl})
      : _authDataSourceImpl = authDataSourceImpl ?? Get.find();
  @override
  Future<Either<Failure, User>> login(
      {required String email, required String password}) async {
    try {
      final user = await _authDataSourceImpl.loginUser(email, password);
      return right(user.toEntity());
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> register(
      {required String email,
      required String password,
      required String name}) async {
    try {
      UserModel newUser = UserModel(
        name: name,
        email: email,
        password: password,
        authExpiredDate: DateTime.now().add(const Duration(days: 7)),
      );
      await _authDataSourceImpl.registerUser(newUser);
      final user = await _authDataSourceImpl.loginUser(email, password);
      return right(user.toEntity());
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> checkAuth() async {
    try {
      final user = await _authDataSourceImpl.checkAuth();
      return right(user.toEntity());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> loginNFC(Map nfc) async {
    try {
      final user = await _authDataSourceImpl.loginNFC(nfc);
      return right(user.toEntity());
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logOut() async {
    try {
      await _authDataSourceImpl.logout();
      return right(true);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}

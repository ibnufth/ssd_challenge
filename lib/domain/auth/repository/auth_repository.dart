import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../user/entity/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(
      {required String email, required String password});
  Future<Either<Failure, User>> register({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, User>> checkAuth();
  Future<Either<Failure, bool>> logOut();
  Future<Either<Failure, User>> loginNFC(Map nfc);
}

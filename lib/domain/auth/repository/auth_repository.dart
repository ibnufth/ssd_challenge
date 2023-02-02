import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../user/entity/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> register(
    String email,
    String password,
    String name,
  );
}

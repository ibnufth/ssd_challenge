import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/use_case.dart';
import '../../user/entity/user.dart';
import '../repository/auth_repository.dart';

class CheckAuth implements UseCase<User, NoParams> {
  final AuthRepository _repository;

  CheckAuth({AuthRepository? repository})
      : _repository = repository ?? Get.find();

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await _repository.checkAuth();
  }
}

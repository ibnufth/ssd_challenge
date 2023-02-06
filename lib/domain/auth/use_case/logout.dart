import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:synapsis_challenge/core/util/use_case.dart';

import '../../../core/error/failure.dart';
import '../repository/auth_repository.dart';

class LogoutUseCase implements UseCase<bool, NoParams> {
  final AuthRepository _repository;

  LogoutUseCase({AuthRepository? repository})
      : _repository = repository ?? Get.find();

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _repository.logOut();
  }
}

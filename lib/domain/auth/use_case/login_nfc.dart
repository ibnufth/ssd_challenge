import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/use_case.dart';
import '../../user/entity/user.dart';
import '../repository/auth_repository.dart';

class LoginNFCUseCase implements UseCase<User, Map> {
  final AuthRepository _repository;

  LoginNFCUseCase({AuthRepository? repository})
      : _repository = repository ?? Get.find();

  @override
  Future<Either<Failure, User>> call(Map params) async {
    return await _repository.loginNFC(params);
  }
}

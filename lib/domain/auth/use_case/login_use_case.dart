// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'package:synapsis_challenge/core/util/use_case.dart';
import 'package:synapsis_challenge/domain/auth/repository/auth_repository.dart';
import 'package:synapsis_challenge/domain/user/entity/user.dart';

import '../../../core/error/failure.dart';

class LoginUseCase  implements UseCase<User, LoginParams> {
  final AuthRepository _repository;

  LoginUseCase({ AuthRepository? repository})
      : _repository = repository ?? Get.find();

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await _repository.login(email: params.email,password: params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}

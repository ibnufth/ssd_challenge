// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'package:synapsis_challenge/domain/user/entity/user.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/use_case.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase implements UseCase<User, RegisterParams> {
  final AuthRepository _repository;

  RegisterUseCase({AuthRepository? repository})
      : _repository = repository ?? Get.find();
  @override
  Future<Either<Failure, User>> call(RegisterParams params) async {
    return await _repository.register(
      email: params.email,
      password: params.password,
      name:   params.name,
    );
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String password;

  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });
}

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/use_case.dart';
import '../entity/qr.dart';
import '../repository/qr_repository.dart';

class AddQRUseCase extends UseCase<QR, QR> {
  final QRRepository _repository;

  AddQRUseCase({QRRepository? repository})
      : _repository = repository ?? Get.find();

  @override
  Future<Either<Failure, QR>> call(QR params) {
    return _repository.addQR(params);
  }
}

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:synapsis_challenge/domain/qr/repository/qr_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/use_case.dart';
import '../entity/qr.dart';

class UpdateQRUseCase extends UseCase<QR, QR> {
  final QRRepository _repository;

  UpdateQRUseCase() : _repository = Get.find();

  @override
  Future<Either<Failure, QR>> call(QR params) async {
    return await _repository.updateQR(
      qr: params,
    );
  }
}

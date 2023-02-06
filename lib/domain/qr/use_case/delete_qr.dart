import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/use_case.dart';
import '../entity/qr.dart';
import '../repository/qr_repository.dart';

class DeleteQRUseCase extends UseCase<void, QR> {
  final QRRepository _repository;

  DeleteQRUseCase() : _repository = Get.find();

  @override
  Future<Either<Failure, void>> call(QR params) async {
    return await _repository.deleteQR(
      qr: params,
    );
  }
}

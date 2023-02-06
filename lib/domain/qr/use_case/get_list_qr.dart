import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/use_case.dart';
import '../entity/qr.dart';
import '../repository/qr_repository.dart';

class GetQRListUseCase extends UseCase<List<QR>, NoParams> {
  final QRRepository _repository;

  GetQRListUseCase({QRRepository? repository})
      : _repository = repository ?? Get.find();

  @override
  Future<Either<Failure, List<QR>>> call(NoParams params) {
    return _repository.getListQR();
  }
}

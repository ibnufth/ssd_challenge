import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/error/failure.dart';
import '../../../domain/qr/entity/qr.dart';
import '../../../domain/qr/repository/qr_repository.dart';
import '../data_source/qr_local_data_source.dart';
import '../model/qr_model.dart';

class QRRepositoryImpl implements QRRepository {
  final QRLocalDataSource _dataSource;

  QRRepositoryImpl({QRLocalDataSource? dataSource})
      : _dataSource = dataSource ?? Get.find();

  @override
  Future<Either<Failure, List<QR>>> getListQR() async {
    try {
      final models = await _dataSource.getListQR();
      final List<QR> qrs = models.map((model) => model.toEntity()).toList();

      return Right(qrs);
    } catch (e) {
      Get.log(e.toString());
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, QR>> addQR(QR qr) async {
    try {
      final QRModel model = QRModel.fromEntity(qr);
      final addedModel = await _dataSource.addQR(model: model);
      final addedQR = addedModel.toEntity();

      return Right(addedQR);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, QR>> updateQR({required QR qr}) async {
    try {
      final result = await _dataSource.updateQR(model: QRModel.fromEntity(qr));
      return Right(result.toEntity());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteQR({required QR qr}) async {
    try {
      await _dataSource.deleteQR(model: QRModel.fromEntity(qr));
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}

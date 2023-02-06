import 'package:dartz/dartz.dart';
import 'package:synapsis_challenge/core/error/failure.dart';
import 'package:synapsis_challenge/domain/qr/entity/qr.dart';

abstract class QRRepository {
  Future<Either<Failure, List<QR>>> getListQR();
  Future<Either<Failure, QR>> addQR(QR qr);
  Future<Either<Failure, QR>> updateQR({required QR qr});
  Future<Either<Failure, void>> deleteQR({required QR qr});
}

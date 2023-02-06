import 'package:floor_annotation/floor_annotation.dart';

import 'qr_model.dart';

@dao
abstract class QRDao {
  @Query('SELECT * FROM QRModel')
  Future<List<QRModel>> getAllQRModels();

  @insert
  Future<void> insertQRModel(QRModel qrModel);

  @update
  Future<void> updateQRModel(QRModel qrModel);

  @delete
  Future<void> deleteQRModel(QRModel qrModel);
}
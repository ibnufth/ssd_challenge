import '../model/qr_dao.dart';
import '../model/qr_model.dart';

abstract class QRLocalDataSource {
  Future<List<QRModel>> getListQR();
  Future<QRModel> addQR({required QRModel model});

  Future<QRModel> updateQR({required QRModel model});

  Future<void> deleteQR({required QRModel model});
}

class QRLocalDataSourceImpl implements QRLocalDataSource {
  final QRDao qrDao;

  QRLocalDataSourceImpl({required this.qrDao});

  @override
  Future<List<QRModel>> getListQR() async {
    return await qrDao.getAllQRModels();
  }

  @override
  Future<QRModel> addQR({required QRModel model}) async {
    await qrDao.insertQRModel(model);
    return model;
  }

  @override
  Future<void> deleteQR({required QRModel model}) {
    return qrDao.deleteQRModel(model);
  }

  @override
  Future<QRModel> updateQR({required QRModel model}) async {
    await qrDao.updateQRModel(model);
    return model;
  }
}

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/auth/data_source/auth_local_data_source.dart';
import '../../data/auth/repository/auth_repository_impl.dart';
import '../../data/qr/data_source/qr_local_data_source.dart';
import '../../data/qr/repository/qr_repository_impl.dart';
import '../../domain/auth/repository/auth_repository.dart';
import '../../domain/auth/use_case/login_nfc.dart';
import '../../domain/auth/use_case/login_use_case.dart';
import '../../domain/auth/use_case/logout.dart';
import '../../domain/auth/use_case/register_use_case.dart';
import '../../domain/qr/repository/qr_repository.dart';
import '../../presentation/auth/controllers/auth_controller.dart';
import '../res/reference.dart';
import '../service/database/app_local_database.dart';

class DependencyCreator {
  static init() async {
    //service
    await Get.putAsync<AppDatabase>(
        () => $FloorAppDatabase.databaseBuilder(databaseName).build(),
        permanent: true);
    await Get.putAsync<SharedPreferences>(() => SharedPreferences.getInstance(),
        permanent: true);

    // repository
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
    Get.lazyPut<QRRepository>(() => QRRepositoryImpl());

    // data source
    Get.lazyPut<AuthDataSource>(() => AuthDataSourceImpl(
        userDao: Get.find<AppDatabase>().userDao,
        sharedPreferences: Get.find()));
    Get.lazyPut<QRLocalDataSource>(() => QRLocalDataSourceImpl(
          qrDao: Get.find<AppDatabase>().qrDao,
        ));

    // use case
    Get.lazyPut(() => RegisterUseCase());
    Get.lazyPut(() => LoginUseCase());
    Get.lazyPut(() => LoginNFCUseCase());
    Get.lazyPut(() => LogoutUseCase());

    //controller
    Get.put<AuthController>(
      AuthController(Get.find(), Get.find(), Get.find(), Get.find()),
      permanent: true,
    );
  }
}

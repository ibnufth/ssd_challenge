import 'package:get/get.dart';
import 'package:synapsis_challenge/domain/auth/repository/auth_repository.dart';

import '../../data/auth/repository/auth_repository_impl.dart';
import '../res/reference.dart';
import '../service/database/app_local_database.dart';

class DependencyCreator {
  static init() {
    Get.putAsync<AppDatabase>(() async =>
        await $FloorAppDatabase.databaseBuilder(databaseName).build());
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
  }
}

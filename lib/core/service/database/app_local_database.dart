import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:synapsis_challenge/data/qr/model/qr_dao.dart';

import '../../../data/qr/model/qr_model.dart';
import '../../../data/user/dao/user_dao.dart';
import '../../../data/user/model/user_model.dart';
import '../../util/date_time_converter.dart';

part 'app_local_database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [UserModel, QRModel])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
  QRDao get qrDao;
}

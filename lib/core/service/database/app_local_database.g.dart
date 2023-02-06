// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_local_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  QRDao? _qrDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `users` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `email` TEXT NOT NULL, `password` TEXT NOT NULL, `authExpiredDate` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `QRModel` (`id` INTEGER, `qr_text` TEXT NOT NULL, `qr_date` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  QRDao get qrDao {
    return _qrDaoInstance ??= _$QRDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userModelInsertionAdapter = InsertionAdapter(
            database,
            'users',
            (UserModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'password': item.password,
                  'authExpiredDate':
                      _dateTimeConverter.encode(item.authExpiredDate)
                }),
        _userModelUpdateAdapter = UpdateAdapter(
            database,
            'users',
            ['id'],
            (UserModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'password': item.password,
                  'authExpiredDate':
                      _dateTimeConverter.encode(item.authExpiredDate)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserModel> _userModelInsertionAdapter;

  final UpdateAdapter<UserModel> _userModelUpdateAdapter;

  @override
  Future<List<UserModel>?> getUsers() async {
    return _queryAdapter.queryList('SELECT * FROM users',
        mapper: (Map<String, Object?> row) => UserModel(
            id: row['id'] as int?,
            name: row['name'] as String,
            email: row['email'] as String,
            password: row['password'] as String,
            authExpiredDate:
                _dateTimeConverter.decode(row['authExpiredDate'] as int)));
  }

  @override
  Future<UserModel?> getUserByEmail(String email) async {
    return _queryAdapter.query('SELECT * FROM users WHERE email = ?1',
        mapper: (Map<String, Object?> row) => UserModel(
            id: row['id'] as int?,
            name: row['name'] as String,
            email: row['email'] as String,
            password: row['password'] as String,
            authExpiredDate:
                _dateTimeConverter.decode(row['authExpiredDate'] as int)),
        arguments: [email]);
  }

  @override
  Future<UserModel?> getUserByEmailAndPassword(
    String email,
    String password,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM users WHERE email = ?1 AND password = ?2',
        mapper: (Map<String, Object?> row) => UserModel(
            id: row['id'] as int?,
            name: row['name'] as String,
            email: row['email'] as String,
            password: row['password'] as String,
            authExpiredDate:
                _dateTimeConverter.decode(row['authExpiredDate'] as int)),
        arguments: [email, password]);
  }

  @override
  Future<void> insertUser(UserModel user) async {
    await _userModelInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUser(UserModel user) async {
    await _userModelUpdateAdapter.update(user, OnConflictStrategy.abort);
  }
}

class _$QRDao extends QRDao {
  _$QRDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _qRModelInsertionAdapter = InsertionAdapter(
            database,
            'QRModel',
            (QRModel item) => <String, Object?>{
                  'id': item.id,
                  'qr_text': item.text,
                  'qr_date': _dateTimeConverter.encode(item.date)
                }),
        _qRModelUpdateAdapter = UpdateAdapter(
            database,
            'QRModel',
            ['id'],
            (QRModel item) => <String, Object?>{
                  'id': item.id,
                  'qr_text': item.text,
                  'qr_date': _dateTimeConverter.encode(item.date)
                }),
        _qRModelDeletionAdapter = DeletionAdapter(
            database,
            'QRModel',
            ['id'],
            (QRModel item) => <String, Object?>{
                  'id': item.id,
                  'qr_text': item.text,
                  'qr_date': _dateTimeConverter.encode(item.date)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<QRModel> _qRModelInsertionAdapter;

  final UpdateAdapter<QRModel> _qRModelUpdateAdapter;

  final DeletionAdapter<QRModel> _qRModelDeletionAdapter;

  @override
  Future<List<QRModel>> getAllQRModels() async {
    return _queryAdapter.queryList('SELECT * FROM QRModel',
        mapper: (Map<String, Object?> row) => QRModel(
            id: row['id'] as int?,
            text: row['qr_text'] as String,
            date: _dateTimeConverter.decode(row['qr_date'] as int)));
  }

  @override
  Future<void> insertQRModel(QRModel qrModel) async {
    await _qRModelInsertionAdapter.insert(qrModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateQRModel(QRModel qrModel) async {
    await _qRModelUpdateAdapter.update(qrModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteQRModel(QRModel qrModel) async {
    await _qRModelDeletionAdapter.delete(qrModel);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();

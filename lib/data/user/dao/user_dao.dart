import 'package:floor/floor.dart';

import '../model/user_model.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM users')
  Future<List<UserModel>?> getUsers();

  @insert
  Future<void> insertUser(UserModel user);

  @update
  Future<void> updateUser(UserModel user);

  @Query('SELECT * FROM users WHERE email = :email')
  Future<UserModel?> getUserByEmail(String email);

  @Query('SELECT * FROM users WHERE email = :email AND password = :password')
  Future<UserModel?> getUserByEmailAndPassword(String email, String password);
}

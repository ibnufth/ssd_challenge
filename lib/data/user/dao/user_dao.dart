import 'package:floor/floor.dart';

import '../model/user_model.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM user')
  Future<List<UserModel>?> getUsers();

  @insert
  Future<void> insertUser(UserModel user);

  @Query('SELECT * FROM user WHERE email = :email')
  Future<UserModel?> getUserByEmail(String email);

  @Query(
      'SELECT * FROM user WHERE email = :email AND password = :password')
  Future<UserModel?> getUserByEmailAndPassword(
      String email, String password);
}

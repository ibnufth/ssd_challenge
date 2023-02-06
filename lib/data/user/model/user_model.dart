import 'package:floor/floor.dart';

import '../../../domain/user/entity/user.dart';

@Entity(tableName: "users")
class UserModel {
  @PrimaryKey(autoGenerate: true)
  int? id;

  @ColumnInfo(name: "name")
  String name;

  @ColumnInfo(name: "email")
  String email;

  @ColumnInfo(name: "password")
  String password;

  @ColumnInfo(name: "authExpiredDate")
  DateTime authExpiredDate;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.authExpiredDate,
  });

  static UserModel userNfc = UserModel(
      name: "nfc",
      email: "nfc",
      password: "nfc",
      authExpiredDate: DateTime.now().subtract(const Duration(days: 7)));

  factory UserModel.fromEntity(User entity) {
    return UserModel(
        id: entity.id,
        name: entity.name,
        email: entity.email,
        password: entity.password,
        authExpiredDate: entity.authExpiredDate);
  }

  User toEntity() {
    return User(
        id: id!,
        name: name,
        email: email,
        password: password,
        authExpiredDate: authExpiredDate);
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    DateTime? authExpiredDate,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      authExpiredDate: authExpiredDate ?? this.authExpiredDate,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, password: $password, authExpiredDate: $authExpiredDate)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ password.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final int? id;
  final String name;
  final String email;
  final String password;
  final DateTime authExpiredDate;
  const User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.authExpiredDate,
  });

  static User empty =
      User(name: "", email: "", password: "", authExpiredDate: DateTime(0));

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.authExpiredDate == authExpiredDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        authExpiredDate.hashCode;
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password, authExpiredDate: $authExpiredDate)';
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    DateTime? authExpiredDate,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      authExpiredDate: authExpiredDate ?? this.authExpiredDate,
    );
  }
}

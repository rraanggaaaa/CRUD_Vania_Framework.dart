import 'package:vania/vania.dart';

class UsersModel extends Model {
  // Properti sesuai dengan kolom dalam tabel
  int? id;
  String? name;
  String? username;
  String? email;
  String? password;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  // Constructor
  UsersModel() {
    super.table('users');
  }

  // Mengonversi dari Map ke objek User
  UsersModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    username = map['username'];
    email = map['email'];
    password = map['password'];
    createdAt = map['created_at'] != null ? DateTime.parse(map['created_at']) : null;
    updatedAt = map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null;
    deletedAt = map['deleted_at'] != null ? DateTime.parse(map['deleted_at']) : null;
  }

  // Mengonversi dari objek User ke Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
    };
  }
}

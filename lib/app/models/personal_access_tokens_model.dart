// personal_access_token.dart
import 'package:vania/vania.dart';

class PersonalAccessToken extends Model {
  String? token;
  String? name;
  String? username;
  int? tokenableId;
  String? tokenableType;
  DateTime? createdAt;

  PersonalAccessToken();

  // Factory constructor to create a token instance
  factory PersonalAccessToken.create({
    required int tokenableId,
    required String tokenableType,
    required String token,
    required String name,
    required String username,
    required DateTime createdAt,
  }) {
    return PersonalAccessToken()
      ..tokenableId = tokenableId
      ..tokenableType = tokenableType
      ..token = token
      ..name = name
      ..username = username
      ..createdAt = createdAt;
  }

  // Save the token to the database
  Future<void> save() async {
    await query().create(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'name': name,
      'username': username,
      'tokenable_id': tokenableId,
      'tokenable_type': tokenableType,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}

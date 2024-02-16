import 'package:chat_app/chat-app/domain/entities/UserEntity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.phone,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['owner'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email
  });

  @override
  List<Object> get props => [id, firstName, lastName, phone,email];
}
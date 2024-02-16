import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String statusMessage;

  const ErrorMessageModel({
    required this.statusMessage,
  });



  @override
  List<Object?> get props => [
        statusMessage,
      ];
}
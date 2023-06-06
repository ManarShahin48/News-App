import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final String status;
  final int code;
  final String message;

  const ErrorModel({
    required this.status,
    required this.code,
    required this.message,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );

  @override
  List<Object?> get props => [
        status,
        code,
        message,
      ];
}

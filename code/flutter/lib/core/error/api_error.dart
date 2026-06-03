class ApiErrorResponse {
  final String message;
  final String? httpStatus;
  final String? localDateTime;
  final int? code;

  const ApiErrorResponse({
    required this.message,
    this.httpStatus,
    this.localDateTime,
    this.code,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse(
      message: json['message'] as String? ?? 'Неизвестная ошибка',
      httpStatus: json['httpStatus'] as String?,
      localDateTime: json['localDateTime'] as String?,
      code: json['code'] as int?,
    );
  }
}

class ApiResponse<T> {
  final bool success;
  final String message;
  final T data;

  const ApiResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    return ApiResponse<T>(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: fromJsonT(json['data']),
    );
  }
}

class ApiPaginateResponse<T> {
  final bool success;
  final String message;
  final T results;
  final int total;
  final int page;
  final int size;
  final bool hasNext;

  const ApiPaginateResponse({
    required this.success,
    required this.message,
    required this.results,
    required this.total,
    required this.page,
    required this.size,
    required this.hasNext,
  });

  factory ApiPaginateResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    return ApiPaginateResponse<T>(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      results: fromJsonT(json['results']),
      total: json['total'] as int? ?? 0,
      page: json['page'] as int? ?? 1,
      size: json['size'] as int? ?? 10,
      hasNext: json['hasNext'] as bool? ?? false,
    );
  }
}

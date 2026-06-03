class JwtResponse {
  final String accessToken;

  const JwtResponse({required this.accessToken});

  factory JwtResponse.fromJson(Map<String, dynamic> json) =>
      JwtResponse(accessToken: json['accessToken'] as String);
}

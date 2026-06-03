import 'package:freezed_annotation/freezed_annotation.dart';
import 'role.dart';

part 'auth_me.freezed.dart';
part 'auth_me.g.dart';

@freezed
class AuthMe with _$AuthMe {
  const AuthMe._();

  const factory AuthMe({
    required String id,
    required String firstName,
    required String lastName,
    String? middleName,
    String? email,
    String? phoneNumber,
    String? gender,
    required String status,
    String? birthDate,
    String? profileImageAttachmentId,
    String? profileImageUrl,
    String? profileBackgroundAttachmentId,
    String? profileBackgroundUrl,
    @Default([]) List<Role> roles,
  }) = _AuthMe;

  factory AuthMe.fromJson(Map<String, dynamic> json) => _$AuthMeFromJson(json);

  String get fullName => '$firstName $lastName'.trim();

  bool get isAdmin =>
      roles.any((r) => r.name == 'ADMIN' || r.name == 'SUPER_ADMIN');

  bool get isTeacher => roles.any((r) => r.name == 'TEACHER');

  bool get isStudent => roles.any((r) => r.name == 'STUDENT');
}

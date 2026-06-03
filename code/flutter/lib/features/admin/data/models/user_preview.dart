import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preview.freezed.dart';
part 'user_preview.g.dart';

@freezed
class UserPreview with _$UserPreview {
  const UserPreview._();

  const factory UserPreview({
    required String id,
    required String firstName,
    required String lastName,
    String? middleName,
    String? email,
    String? phoneNumber,
    required String status,
    String? profileImageUrl,
    String? profileBackgroundUrl,
    @Default([]) List<String> roles,
  }) = _UserPreview;

  factory UserPreview.fromJson(Map<String, dynamic> json) =>
      _$UserPreviewFromJson(json);

  String get fullName => '$firstName $lastName'.trim();
  String get rolesLabel => roles.isEmpty ? '—' : roles.join(', ');
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = LoginRequested;

  const factory AuthEvent.registerRequested({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) = RegisterRequested;

  const factory AuthEvent.passwordResetRequested({
    required String email,
  }) = PasswordResetRequested;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = InitialStateAuth;

  const factory AuthState.loading() = LoadingStateAuth;

  const factory AuthState.authenticated({
    required String name,
    required String email,
  }) = AuthenticatedStateAuth;

  const factory AuthState.success({
    required String message,
  }) = SuccessStateAuth;

  const factory AuthState.failure({
    required String message,
  }) = FailedStateAuth;
}

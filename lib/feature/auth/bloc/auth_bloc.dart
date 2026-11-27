import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initial()) {
    on<LoginRequested>(_onLogin);
    on<RegisterRequested>(_onRegister);
    on<PasswordResetRequested>(_onPasswordReset);
  }

  Future<void> _onLogin(LoginRequested event, Emitter<AuthState> emit) async {
    if (event.email.isEmpty || event.password.isEmpty) {
      emit(const AuthState.failure(message: 'الرجاء ملء جميع الحقول'));
      return;
    }

    emit(const AuthState.loading());

    await Future.delayed(const Duration(milliseconds: 700));

    emit(AuthState.authenticated(
      name: event.email.split('@').first,
      email: event.email,
    ));
  }

  Future<void> _onRegister(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    if (event.name.isEmpty ||
        event.email.isEmpty ||
        event.password.isEmpty ||
        event.confirmPassword.isEmpty) {
      emit(const AuthState.failure(message: 'الرجاء ملء جميع الحقول'));
      return;
    }

    if (event.password.length < 8) {
      emit(const AuthState.failure(
          message: 'كلمة المرور يجب أن تكون 8 أحرف على الأقل'));
      return;
    }

    if (event.password != event.confirmPassword) {
      emit(const AuthState.failure(message: 'كلمتا المرور غير متطابقتين'));
      return;
    }

    emit(const AuthState.loading());

    await Future.delayed(const Duration(milliseconds: 700));

    emit(const AuthState.success(message: 'تم إنشاء الحساب بنجاح!'));
  }

  Future<void> _onPasswordReset(
    PasswordResetRequested event,
    Emitter<AuthState> emit,
  ) async {
    if (event.email.isEmpty) {
      emit(const AuthState.failure(message: 'الرجاء إدخال البريد الإلكتروني'));
      return;
    }

    emit(const AuthState.loading());

    await Future.delayed(const Duration(milliseconds: 700));

    emit(const AuthState.success(
      message: 'تم إرسال رابط إعادة تعيين كلمة المرور بنجاح!',
    ));
  }
}

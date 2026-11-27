import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/core/widgets/app_primary_button.dart';
import 'package:fankosh/feature/auth/bloc/auth_bloc.dart';
import 'package:fankosh/feature/auth/bloc/auth_event.dart';
import 'package:fankosh/feature/auth/bloc/auth_state.dart';
import 'package:fankosh/feature/auth/forgetpassword/forget_password_screen.dart';
import 'package:fankosh/feature/auth/signup/signup_screen.dart';
import 'package:fankosh/feature/auth/widgets/auth_header.dart';
import 'package:fankosh/feature/auth/widgets/auth_text_field.dart';
import 'package:fankosh/feature/plans/plans_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ValueNotifier لإلغاء setState تماماً من الشاشة
  final ValueNotifier<bool> _isPasswordObscured = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _rememberMe = ValueNotifier<bool>(false);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _isPasswordObscured.dispose();
    _rememberMe.dispose();
    super.dispose();
  }

  void _onLoginPressed(BuildContext context) {
    // إرسال البيانات للـ Bloc؛ التحقق بالكامل داخل الـ Bloc
    context.read<AuthBloc>().add(
          AuthEvent.loginRequested(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is FailedStateAuth) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red.shade700,
                behavior: SnackBarBehavior.floating,
              ),
            );
          } else if (state is AuthenticatedStateAuth) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('أهلاً بك يا ${state.name}!'),
                backgroundColor: Colors.green.shade700,
                behavior: SnackBarBehavior.floating,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PlansScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is LoadingStateAuth;

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: ColorManager.backgroundColor,
              body: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),

                        // Shared Auth Header
                        const AuthHeader(
                          title: 'نورت فانكوش تاني! 🎬',
                          subtitle: 'سجّل دخولك وكمّل قفشاتك.',
                        ),

                        const SizedBox(height: 36),

                        // Shared Email Field
                        AuthTextField(
                          label: 'البريد الإلكتروني',
                          hintText: 'example@email.com',
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textDirection: TextDirection.ltr,
                          suffixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color(0xFF7E8A9A),
                            size: 20,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Shared Password Field (ValueListenableBuilder بدون أي setState)
                        ValueListenableBuilder<bool>(
                          valueListenable: _isPasswordObscured,
                          builder: (context, isObscured, _) {
                            return AuthTextField(
                              label: 'كلمة المرور',
                              hintText: 'ادخل كلمة المرور',
                              controller: passwordController,
                              obscureText: isObscured,
                              prefixIcon: IconButton(
                                icon: Icon(
                                  isObscured
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: ColorManager.textMuted,
                                  size: 20,
                                ),
                                onPressed: () {
                                  _isPasswordObscured.value =
                                      !_isPasswordObscured.value;
                                },
                              ),
                              suffixIcon: const Icon(
                                Icons.lock_outline,
                                color: ColorManager.textMuted,
                                size: 20,
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 14),

                        // Remember Me & Forgot Password Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Remember Me بدون setState
                            ValueListenableBuilder<bool>(
                              valueListenable: _rememberMe,
                              builder: (context, remember, _) {
                                return InkWell(
                                  onTap: () {
                                    _rememberMe.value = !_rememberMe.value;
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: remember
                                                ? ColorManager.primaryColor
                                                : ColorManager.textMuted,
                                            width: 2,
                                          ),
                                          color: remember
                                              ? ColorManager.primaryColor
                                              : Colors.transparent,
                                        ),
                                        child: remember
                                            ? const Icon(
                                                Icons.check,
                                                size: 14,
                                                color: Colors.white,
                                              )
                                            : null,
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'تذكرني',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF7E8A9A),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),

                            // Forgot Password Link
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPassword(),
                                  ),
                                );
                              },
                              child: const Text(
                                'نسيت كلمة المرور؟',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF299BF5),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 36),

                        // Shared Primary Button ("تسجيل الدخول →")
                        AppPrimaryButton(
                          text: 'تسجيل الدخول',
                          icon: Icons.login_rounded,
                          isLoading: isLoading,
                          onPressed: () => _onLoginPressed(context),
                        ),

                        const SizedBox(height: 24),

                        // Create Account Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'لسه معندكش حساب؟ ',
                              style: TextStyle(
                                color: ColorManager.textAfterButton,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'إنشاء حساب',
                                style: TextStyle(
                                  color: Color(0xFF299BF5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

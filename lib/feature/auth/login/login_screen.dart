import 'package:fankosh/core/widgets/app_primary_button.dart';
import 'package:fankosh/feature/auth/forgetpassword/forget_password_screen.dart';
import 'package:fankosh/feature/auth/signup/signup_screen.dart';
import 'package:fankosh/feature/auth/widgets/auth_header.dart';
import 'package:fankosh/feature/auth/widgets/auth_text_field.dart';
import 'package:fankosh/feature/plans/plans_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isPasswordObscured = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("الرجاء ملء جميع الحقول")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate login
    Future.delayed(const Duration(milliseconds: 600), () {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PlansScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFCFAF5),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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

                  // Shared Password Field
                  AuthTextField(
                    label: 'كلمة المرور',
                    hintText: 'ادخل كلمة المرور',
                    controller: passwordController,
                    obscureText: _isPasswordObscured,
                    prefixIcon: IconButton(
                      icon: Icon(
                        _isPasswordObscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: const Color(0xFF7E8A9A),
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordObscured = !_isPasswordObscured;
                        });
                      },
                    ),
                    suffixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0xFF7E8A9A),
                      size: 20,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Remember Me & Forgot Password Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Remember Me
                      InkWell(
                        onTap: () {
                          setState(() {
                            _rememberMe = !_rememberMe;
                          });
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
                                  color: _rememberMe
                                      ? const Color(0xFFFFBE26)
                                      : const Color(0xFF7E8A9A),
                                  width: 2,
                                ),
                                color: _rememberMe
                                    ? const Color(0xFFFFBE26)
                                    : Colors.transparent,
                              ),
                              child: _rememberMe
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
                      ),

                      // Forgot Password Link
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgetPassword(),
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

                  // Shared Primary Button ("تسجيل الدخول ]→")
                  AppPrimaryButton(
                    text: 'تسجيل الدخول',
                    icon: Icons.login_rounded,
                    isLoading: _isLoading,
                    onPressed: _handleLogin,
                  ),

                  const SizedBox(height: 24),

                  // Create Account Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'لسه معندكش حساب؟ ',
                        style: TextStyle(
                          color: Color(0xFF7E8A9A),
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
  }
}

import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/core/widgets/app_primary_button.dart';
import 'package:fankosh/feature/auth/bloc/auth_bloc.dart';
import 'package:fankosh/feature/auth/bloc/auth_event.dart';
import 'package:fankosh/feature/auth/bloc/auth_state.dart';
import 'package:fankosh/feature/auth/login/login_screen.dart';
import 'package:fankosh/feature/auth/widgets/auth_header.dart';
import 'package:fankosh/feature/auth/widgets/auth_text_field.dart';
import 'package:fankosh/feature/plans/plans_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final ValueNotifier<String> _selectedCountry =
      ValueNotifier<String>('مصر 🇪🇬');
  final ValueNotifier<bool> _isPasswordObscured = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _isConfirmPasswordObscured =
      ValueNotifier<bool>(true);

  final List<String> _countries = [
    'مصر 🇪🇬',
    'السعودية 🇸🇦',
    'الإمارات 🇦🇪',
    'الكويت 🇰🇼',
    'قطر 🇶🇦',
    'الأردن 🇯🇴',
  ];

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    _selectedCountry.dispose();
    _isPasswordObscured.dispose();
    _isConfirmPasswordObscured.dispose();
    super.dispose();
  }

  void _showCountryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'اختر الدولة',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: ValueListenableBuilder<String>(
                    valueListenable: _selectedCountry,
                    builder: (context, currentCountry, _) {
                      return ListView.builder(
                        itemCount: _countries.length,
                        itemBuilder: (ctx, index) {
                          final country = _countries[index];
                          final isSelected = country == currentCountry;

                          return ListTile(
                            title: Text(
                              country,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            trailing: isSelected
                                ? const Icon(Icons.check,
                                    color: ColorManager.primaryColor)
                                : null,
                            onTap: () {
                              _selectedCountry.value = country;
                              Navigator.pop(bottomSheetContext);
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleSignUp(BuildContext context) {
    context.read<AuthBloc>().add(
          AuthEvent.registerRequested(
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            confirmPassword: confirmPasswordController.text.trim(),
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
          } else if (state is SuccessStateAuth) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green.shade700,
                behavior: SnackBarBehavior.floating,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const PlansScreen()),
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
                        const SizedBox(height: 10),

                        // Shared Auth Header
                        const AuthHeader(
                          title: 'يلا ندخلك جوا القفشات! 🎬',
                          subtitle: 'اعمل حسابك وخلي الضحك يبدأ مع فانكوش.',
                          logoWidth: 190,
                        ),

                        const SizedBox(height: 28),

                        // Shared Name Field
                        AuthTextField(
                          label: 'الاسم',
                          hintText: 'اكتب اسمك',
                          controller: nameController,
                          suffixIcon: const Icon(
                            Icons.person_outline,
                            color: Color(0xFF7E8A9A),
                            size: 20,
                          ),
                        ),

                        const SizedBox(height: 16),

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

                        const SizedBox(height: 16),

                        // Country Selection Field بدون setState
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'الدولة',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.textDark,
                              ),
                            ),
                            const SizedBox(height: 6),
                            InkWell(
                              onTap: () => _showCountryPicker(context),
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                      color: ColorManager.borderAlt),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: ColorManager.textMuted,
                                    ),
                                    const Spacer(),
                                    ValueListenableBuilder<String>(
                                      valueListenable: _selectedCountry,
                                      builder: (context, country, _) {
                                        return Text(
                                          country,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: ColorManager.textDark,
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(
                                      Icons.public,
                                      color: ColorManager.textMuted,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Shared Password Field بدون setState
                        ValueListenableBuilder<bool>(
                          valueListenable: _isPasswordObscured,
                          builder: (context, isObscured, _) {
                            return AuthTextField(
                              label: 'كلمة المرور',
                              hintText: 'أنشئ كلمة مرور',
                              controller: passwordController,
                              obscureText: isObscured,
                              helperText: 'استخدم 8 أحرف على الأقل.',
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

                        const SizedBox(height: 16),

                        // Shared Confirm Password Field بدون setState
                        ValueListenableBuilder<bool>(
                          valueListenable: _isConfirmPasswordObscured,
                          builder: (context, isObscured, _) {
                            return AuthTextField(
                              label: 'تأكيد كلمة المرور',
                              hintText: 'أعد إدخال كلمة المرور',
                              controller: confirmPasswordController,
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
                                  _isConfirmPasswordObscured.value =
                                      !_isConfirmPasswordObscured.value;
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

                        const SizedBox(height: 32),

                        // Shared Primary Button ("إنشاء حساب ←")
                        AppPrimaryButton(
                          text: 'إنشاء حساب',
                          icon: Icons.arrow_back,
                          isLoading: isLoading,
                          onPressed: () => _handleSignUp(context),
                        ),

                        const SizedBox(height: 20),

                        // Already Have Account Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'عندك حساب بالفعل؟ ',
                              style: TextStyle(
                                color: ColorManager.textAfterButton,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'تسجيل الدخول',
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

import 'package:fankosh/core/widgets/app_primary_button.dart';
import 'package:fankosh/feature/auth/login/login_screen.dart';
import 'package:fankosh/feature/auth/widgets/auth_header.dart';
import 'package:fankosh/feature/auth/widgets/auth_text_field.dart';
import 'package:fankosh/feature/plans/plans_screen.dart';
import 'package:flutter/material.dart';

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

  String _selectedCountry = 'مصر 🇪🇬';
  final List<String> _countries = [
    'مصر 🇪🇬',
    'السعودية 🇸🇦',
    'الإمارات 🇦🇪',
    'الكويت 🇰🇼',
    'قطر 🇶🇦',
    'الأردن 🇯🇴',
  ];

  bool _isLoading = false;
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
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
                  child: ListView.builder(
                    itemCount: _countries.length,
                    itemBuilder: (context, index) {
                      final country = _countries[index];
                      final isSelected = country == _selectedCountry;
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
                            ? const Icon(Icons.check, color: Color(0xFFFFBE26))
                            : null,
                        onTap: () {
                          setState(() {
                            _selectedCountry = country;
                          });
                          Navigator.pop(context);
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

  void _handleSignUp() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("الرجاء ملء جميع الحقول")),
      );
      return;
    }

    if (password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("كلمة المرور يجب أن تكون 8 أحرف على الأقل")),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("كلمتا المرور غير متطابقتين")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate signup
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

                  // Country Selection Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'الدولة',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E2833),
                        ),
                      ),
                      const SizedBox(height: 6),
                      InkWell(
                        onTap: _showCountryPicker,
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xFFE2E6EE)),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Color(0xFF7E8A9A),
                              ),
                              const Spacer(),
                              Text(
                                _selectedCountry,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1E2833),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.public,
                                color: Color(0xFF7E8A9A),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Shared Password Field
                  AuthTextField(
                    label: 'كلمة المرور',
                    hintText: 'أنشئ كلمة مرور',
                    controller: passwordController,
                    obscureText: _isPasswordObscured,
                    helperText: 'استخدم 8 أحرف على الأقل.',
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

                  // Shared Confirm Password Field
                  AuthTextField(
                    label: 'تأكيد كلمة المرور',
                    hintText: 'أنشئ كلمة مرور',
                    controller: confirmPasswordController,
                    obscureText: _isConfirmPasswordObscured,
                    prefixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordObscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: const Color(0xFF7E8A9A),
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordObscured =
                              !_isConfirmPasswordObscured;
                        });
                      },
                    ),
                    suffixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0xFF7E8A9A),
                      size: 20,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Shared Primary Button ("إنشاء حساب ←")
                  AppPrimaryButton(
                    text: 'إنشاء حساب',
                    icon: Icons.arrow_back,
                    isLoading: _isLoading,
                    onPressed: _handleSignUp,
                  ),

                  const SizedBox(height: 20),

                  // Already Have Account Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'عندك حساب بالفعل؟ ',
                        style: TextStyle(
                          color: Color(0xFF7E8A9A),
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
  }
}

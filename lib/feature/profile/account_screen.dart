import 'package:fankosh/core/assets/app_assets.dart';
import 'package:fankosh/core/localization/app_localization.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/core/widgets/fankosh_bottom_nav_bar.dart';
import 'package:fankosh/feature/birthday/birthday_dialog.dart';
import 'package:fankosh/feature/home/home_screen.dart';
import 'package:fankosh/feature/my_plan/my_plan_screen.dart';
import 'package:fankosh/feature/notifications/notifications_screen.dart';
import 'package:fankosh/feature/profile/edit_profile_screen.dart';
import 'package:fankosh/feature/profile/widgets/country_bottom_sheet.dart';
import 'package:fankosh/feature/profile/widgets/language_bottom_sheet.dart';
import 'package:fankosh/feature/profile/widgets/logout_tile_button.dart';
import 'package:fankosh/feature/profile/widgets/settings_tile_item.dart';
import 'package:fankosh/feature/profile/widgets/subscription_banner_card.dart';
import 'package:fankosh/feature/profile/widgets/user_profile_card.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String _currentCountry = 'مصر 🇪🇬';
  String _userName = 'أحمد محمد';
  String? _profileImagePath;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              // Top Soft Yellow Wave Decoration
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 190,
                child: CustomPaint(
                  painter: _TopWavePainter(),
                ),
              ),

              // Scrollable Content
              Positioned.fill(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 110, // padding for floating bottom nav
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Custom Top Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Profile Icon (Right in RTL)
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorManager.textDark,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.person_outline_rounded,
                              color: ColorManager.textDark,
                              size: 22,
                            ),
                          ),

                          // Logo (Center)
                          Image.asset(
                            AppAssets.fankoshLogo,
                            height: 42,
                            fit: BoxFit.contain,
                          ),

                          // Notifications Bell (Left in RTL)
                          IconButton(
                            icon: const Icon(
                              Icons.notifications_none_outlined,
                              color: ColorManager.textDark,
                              size: 26,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationsScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      // Title Section
                      const Column(
                        children: [
                          Text(
                            'حسابي',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              color: ColorManager.textDark,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'كل حاجة تخص حسابك في مكان واحد',
                            style: TextStyle(
                              fontSize: 13.5,
                              color: Color(0xFF6B7280),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // User Profile Info Card
                      UserProfileCard(
                        name: _userName,
                        email: 'ahmed@example.com',
                        imagePath: _profileImagePath,
                        onEdit: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(
                                initialImage: _profileImagePath,
                              ),
                            ),
                          );
                          if (result != null && result is Map) {
                            setState(() {
                              if (result['image'] != null) {
                                _profileImagePath = result['image'] as String?;
                              }
                              if (result['name'] != null &&
                                  (result['name'] as String).isNotEmpty) {
                                _userName = result['name'] as String;
                              }
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 14),

                      // Subscription Info Card ("اشتراكي: فانكوش بلس")
                      SubscriptionBannerCard(
                        planTitle: 'فانكوش بلس',
                        remainingAttempts: 28,
                        onViewPlan: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyPlanScreen(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      // Settings Section Title
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'الإعدادات',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: ColorManager.textDark,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Settings Card Container
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: ColorManager.cardBackground,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFF1F3F6)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.02),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SettingsTileItem(
                              title: 'تاريخ الميلاد',
                              subtitle: 'أضف تاريخ ميلادك',
                              icon: Icons.cake_outlined,
                              iconBgColor: const Color(0xFFFDF6E9),
                              iconColor: const Color(0xFF8D6E12),
                              onTap: () {
                                BirthdayDialog.show(context);
                              },
                            ),
                            const Divider(
                              height: 1,
                              indent: 20,
                              endIndent: 20,
                              color: ColorManager.dividerColor,
                            ),
                            SettingsTileItem(
                              title: 'الإشعارات',
                              subtitle: 'التحكم في إشعارات فانكوش',
                              icon: Icons.notifications_none_rounded,
                              iconBgColor: const Color(0xFFFFF9E6),
                              iconColor: const Color(0xFFF5A623),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationsScreen(),
                                  ),
                                );
                              },
                            ),
                            const Divider(
                              height: 1,
                              indent: 20,
                              endIndent: 20,
                              color: ColorManager.dividerColor,
                            ),
                            SettingsTileItem(
                              title: 'الدولة',
                              subtitle: _currentCountry,
                              icon: Icons.public_rounded,
                              iconBgColor: const Color(0xFFF3F4F6),
                              iconColor: const Color(0xFF4B5563),
                              onTap: () async {
                                final res = await CountryBottomSheet.show(
                                  context,
                                  _currentCountry,
                                );
                                if (res != null) {
                                  setState(() => _currentCountry = res);
                                }
                              },
                            ),
                            const Divider(
                              height: 1,
                              indent: 20,
                              endIndent: 20,
                              color: ColorManager.dividerColor,
                            ),
                            SettingsTileItem(
                              title: 'اللغة',
                              subtitle: AppLocaleController.isArabic
                                  ? 'العربية'
                                  : 'English',
                              icon: Icons.language_rounded,
                              iconBgColor: const Color(0xFFF3F4F6),
                              iconColor: const Color(0xFF4B5563),
                              onTap: () async {
                                final res = await LanguageBottomSheet.show(
                                  context,
                                  AppLocaleController
                                      .currentLocale.languageCode,
                                );
                                if (res != null) {
                                  AppLocaleController.changeLocale(
                                    Locale(res),
                                  );
                                  setState(() {});
                                }
                              },
                            ),
                            const Divider(
                              height: 1,
                              indent: 20,
                              endIndent: 20,
                              color: ColorManager.dividerColor,
                            ),
                            SettingsTileItem(
                              title: 'الخصوصية والأمان',
                              subtitle: 'إعدادات الأمان والخصوصية',
                              icon: Icons.shield_outlined,
                              iconBgColor: const Color(0xFFF3F4F6),
                              iconColor: const Color(0xFF4B5563),
                              onTap: () {},
                            ),
                            const Divider(
                              height: 1,
                              indent: 20,
                              endIndent: 20,
                              color: ColorManager.dividerColor,
                            ),
                            SettingsTileItem(
                              title: 'المساعدة والدعم',
                              subtitle: 'محتاج مساعدة؟ إحنا هنا',
                              icon: Icons.support_agent_rounded,
                              iconBgColor: const Color(0xFFF3F4F6),
                              iconColor: const Color(0xFF4B5563),
                              onTap: () {},
                            ),
                            const Divider(
                              height: 1,
                              indent: 20,
                              endIndent: 20,
                              color: ColorManager.dividerColor,
                            ),
                            SettingsTileItem(
                              title: 'عن فانكوش',
                              subtitle: 'معلومات التطبيق والإصدار 1.4',
                              icon: Icons.info_outline_rounded,
                              iconBgColor: const Color(0xFFF3F4F6),
                              iconColor: const Color(0xFF4B5563),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Logout Button
                      LogoutTileButton(
                        onLogout: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('تم تسجيل الخروج بنجاح'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              // Floating Bottom Navigation Bar (Tab 2: حسابي Active)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: FankoshBottomNavBar(
                  currentIndex: 2,
                  onTap: (index) {
                    if (index == 0) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } else if (index == 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyPlanScreen(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFF4D2).withValues(alpha: 0.75)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height * 0.72);
    path.quadraticBezierTo(
      size.width * 0.35,
      size.height * 0.98,
      size.width * 0.62,
      size.height * 0.76,
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.56,
      size.width,
      size.height * 0.82,
    );
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

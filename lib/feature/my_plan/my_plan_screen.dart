import 'package:fankosh/core/assets/app_assets.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/my_plan/plan_details_screen.dart';
import 'package:fankosh/feature/my_plan/select_plan_screen.dart';
import 'package:fankosh/feature/my_plan/widgets/current_plan_card.dart';
import 'package:fankosh/feature/my_plan/widgets/need_more_attempts_banner.dart';
import 'package:fankosh/feature/my_plan/widgets/remaining_attempts_card.dart';
import 'package:fankosh/feature/notifications/notifications_screen.dart';
import 'package:fankosh/feature/plans/plans_screen.dart';
import 'package:fankosh/feature/profile/account_screen.dart';
import 'package:flutter/material.dart';

class MyPlanScreen extends StatefulWidget {
  const MyPlanScreen({super.key});

  @override
  State<MyPlanScreen> createState() => _MyPlanScreenState();
}

class _MyPlanScreenState extends State<MyPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Custom Top App Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Notifications Bell
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
                            builder: (context) => const NotificationsScreen(),
                          ),
                        );
                      },
                    ),

                    // App Logo
                    Image.asset(
                      AppAssets.fankoshLogo,
                      height: 40,
                      fit: BoxFit.contain,
                    ),

                    // Profile Icon
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AccountScreen(),
                          ),
                        );
                      },
                      child: Container(
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
                    ),
                  ],
                ),
              ),

              // Title Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  children: [
                    Text(
                      'باقتي',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: ColorManager.textDark,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'كل تفاصيل اشتراكك مع فانكوش',
                      style: TextStyle(
                        fontSize: 13,
                        color: ColorManager.textMuted,
                      ),
                    ),
                  ],
                ),
              ),

              // Scrollable Cards
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 95,
                  ),
                  child: Column(
                    children: [
                      // Current Plan Card
                      const CurrentPlanCard(
                        title: 'فانكوش بلس',
                        attempts: 40,
                        days: 30,
                        priceText: '350 ج.م',
                        expiryDate: '15 نوفمبر 2026',
                      ),

                      const SizedBox(height: 14),

                      // Remaining Attempts Card
                      const RemainingAttemptsCard(
                        remaining: 28,
                        total: 40,
                        showHeader: true,
                      ),

                      const SizedBox(height: 14),

                      // Navigation Actions Card
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: ColorManager.cardBackground,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: ColorManager.borderLight),
                        ),
                        child: Column(
                          children: [
                            // Plan Details Action
                            _buildActionTile(
                              title: 'تفاصيل الباقة',
                              subtitle: 'عرض كل تفاصيل اشتراكك',
                              icon: Icons.description_outlined,
                              iconColor: ColorManager.blueButton,
                              iconBgColor: ColorManager.blueLight,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PlanDetailsScreen(),
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

                            // Renew or Change Plan Action
                            _buildActionTile(
                              title: 'تجديد أو تغيير الباقة',
                              subtitle: 'اختار باقة جديدة أو جدّد اشتراكك',
                              icon: Icons.sync_rounded,
                              iconColor: ColorManager.walletPink,
                              iconBgColor: ColorManager.walletPinkBg,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SelectPlanScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Need More Attempts Banner
                      NeedMoreAttemptsBanner(
                        onViewPlans: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PlansScreen(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 14,
              color: ColorManager.textHint,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ColorManager.textMuted,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 14),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
          ],
        ),
      ),
    );
  }
}

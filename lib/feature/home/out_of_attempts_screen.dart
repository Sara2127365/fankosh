import 'package:fankosh/core/assets/app_assets.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/notifications/notifications_screen.dart';
import 'package:fankosh/feature/plans/plans_screen.dart';
import 'package:fankosh/feature/profile/account_screen.dart';
import 'package:flutter/material.dart';

class OutOfAttemptsScreen extends StatelessWidget {
  const OutOfAttemptsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              children: [
                // Top Custom Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Profile Icon (Right in RTL)
                    IconButton(
                      icon: const Icon(
                        Icons.account_circle_outlined,
                        color: ColorManager.textDark,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AccountScreen(),
                          ),
                        );
                      },
                    ),

                    // App Logo (Center)
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
                            builder: (context) => const NotificationsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Attempts Counter Badge (⚡ 0 محاولات)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.badgeYellowBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('⚡', style: TextStyle(fontSize: 14)),
                      SizedBox(width: 4),
                      Text(
                        '0 محاولات',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9E6C00),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Sad Character Illustration
                Image.asset(
                  AppAssets.outOfAttemptsCharacter,
                  height: 190,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 24),

                // Title: القفشات ببلاش خلصت!
                const Text(
                  'القفشات ببلاش خلصت!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF1E232A),
                  ),
                ),

                const SizedBox(height: 8),

                // Subtitle: بس لسه عندنا ضحك كتير! اختار باقتك وكمّل مع فانكوش.
                const Text(
                  'بس لسه عندنا ضحك كتير!\nاختار باقتك وكمّل مع فانكوش.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.5,
                    color: Color(0xFF6B7280),
                    height: 1.45,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 24),

                // Feature Highlights (Card with 3 features)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFF0F2F5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.02),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildFeatureItem(
                        icon: Icons.movie_creation_outlined,
                        label: 'قفشات أكتر',
                      ),
                      _buildFeatureItem(
                        icon: Icons.bolt_rounded,
                        label: 'محاولات أكتر',
                      ),
                      _buildFeatureItem(
                        icon: Icons.sentiment_very_satisfied_rounded,
                        label: 'ضحك مكمّل',
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Primary Yellow Button: اكتشف الباقات ✪
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF7BD1E),
                      foregroundColor: const Color(0xFF1E232A),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlansScreen(),
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'اكتشف الباقات',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E232A),
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.stars_rounded,
                          size: 20,
                          color: Color(0xFF1E232A),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Secondary Text Button: مش دلوقتي
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'مش دلوقتي',
                    style: TextStyle(
                      fontSize: 14.5,
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF7E6),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            size: 22,
            color: const Color(0xFFF5A623),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E232A),
          ),
        ),
      ],
    );
  }
}

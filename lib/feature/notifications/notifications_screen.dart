import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/notifications/widgets/notification_item_card.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: ColorManager.cardBackground,
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorManager.borderLight),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: ColorManager.textDark,
                        ),
                      ),
                    ),

                    // Title
                    const Text(
                      'الإشعارات',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: ColorManager.textDark,
                      ),
                    ),

                    // "تحديد الكل كمقروء"
                    TextButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('تم تحديد كل الإشعارات كمقروءة'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.done_all_rounded,
                        size: 16,
                        color: ColorManager.blueLink,
                      ),
                      label: const Text(
                        'تحديد الكل كمقروء',
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.blueLink,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Notifications List
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  children: const [
                    NotificationItemCard(
                      title: 'باقتك اتفعّلت! 🎉',
                      subtitle: 'اشتراكك جاهز... يلا نكمل قفشات!',
                      time: '11:30 ص',
                      isUnread: true,
                      icon: Icons.military_tech_rounded,
                      iconColor: ColorManager.amberDark,
                      iconBgColor: ColorManager.badgeYellowBg,
                    ),
                    NotificationItemCard(
                      title: 'محاولاتك قربت تخلص!',
                      subtitle: 'فاضلك محاولتين بس!',
                      time: 'أمس',
                      isUnread: false,
                      icon: Icons.bolt_rounded,
                      iconColor: ColorManager.blueButton,
                      iconBgColor: ColorManager.blueLight,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fankosh/core/assets/app_assets.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/birthday/birthday_picker_screen.dart';
import 'package:flutter/material.dart';

class BirthdayDialog extends StatelessWidget {
  const BirthdayDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const BirthdayDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        backgroundColor: ColorManager.cardBackground,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close button
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: ColorManager.greyButtonBg,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      size: 18,
                      color: ColorManager.textMuted,
                    ),
                  ),
                ),
              ),

              // Calendar with Birthday Cake Image
              Image.asset(
                AppAssets.calendarCake,
                width: 130,
                height: 100,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 16),

              // Title
              const Text(
                'فانكوش عايز يعرف عيد ميلادك! 🎂',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: ColorManager.textDark,
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle
              const Text(
                'ضيف تاريخ ميلادك عشان نفاجئك بتهنئة مخصوص في يومك!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.5,
                  color: ColorManager.textMuted,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 22),

              // Add Birthday Button (Blue)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.blueButton,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BirthdayPickerScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'أضيف تاريخ ميلادي',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Not Now Button (Grey)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: ColorManager.greyButtonBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'مش دلوقتي',
                    style: TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.textCharcoal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

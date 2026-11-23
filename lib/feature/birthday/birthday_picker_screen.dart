import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/birthday/widgets/birthday_wheel_picker.dart';
import 'package:flutter/material.dart';

class BirthdayPickerScreen extends StatefulWidget {
  const BirthdayPickerScreen({super.key});

  @override
  State<BirthdayPickerScreen> createState() => _BirthdayPickerScreenState();
}

class _BirthdayPickerScreenState extends State<BirthdayPickerScreen> {
  int _selectedDay = 14;
  int _selectedMonth = 10;
  int _selectedYear = 1998;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 30),

                // Glowing Cake Icon Header
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        ColorManager.primaryColor.withValues(alpha: 0.35),
                        ColorManager.primaryColor.withValues(alpha: 0.08),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '🎂',
                      style: TextStyle(fontSize: 42),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Title
                const Text(
                  'اختار تاريخ ميلادك',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: ColorManager.textDark,
                  ),
                ),

                const SizedBox(height: 30),

                // Birthday Wheel Picker
                BirthdayWheelPicker(
                  onDateChanged: (day, month, year) {
                    setState(() {
                      _selectedDay = day;
                      _selectedMonth = month;
                      _selectedYear = year;
                    });
                  },
                ),

                const Spacer(),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primaryColor,
                      foregroundColor: ColorManager.textDark,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'تم حفظ تاريخ الميلاد: $_selectedDay/$_selectedMonth/$_selectedYear 🎉',
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                      Navigator.pop(context, '$_selectedDay/$_selectedMonth/$_selectedYear');
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_rounded, size: 20, color: ColorManager.textDark),
                        SizedBox(width: 8),
                        Text(
                          'حفظ التاريخ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.textDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // Skip link
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    'تخطي الآن',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.textMuted,
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
}

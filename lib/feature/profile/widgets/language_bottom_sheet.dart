import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatefulWidget {
  final String selectedLanguage;
  final Function(String lang) onLanguageSelected;

  const LanguageBottomSheet({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageSelected,
  });

  static Future<String?> show(BuildContext context, String currentLang) {
    return showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => LanguageBottomSheet(
        selectedLanguage: currentLang,
        onLanguageSelected: (l) => Navigator.pop(context, l),
      ),
    );
  }

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: const BoxDecoration(
          color: ColorManager.cardBackground,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: ColorManager.borderColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            const SizedBox(height: 18),

            // Header
            const Text(
              'اختر اللغة',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w900,
                color: ColorManager.textDark,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'اختر لغة عرض التطبيق.',
              style: TextStyle(fontSize: 12.5, color: ColorManager.textMuted),
            ),

            const SizedBox(height: 22),

            // Arabic Option
            _buildLanguageTile(
              title: 'العربية',
              subtitle: 'Arabic',
              badgeText: 'ع',
              value: 'ar',
            ),

            const SizedBox(height: 10),

            // English Option
            _buildLanguageTile(
              title: 'English',
              subtitle: 'الإنجليزية',
              badgeText: 'EN',
              value: 'en',
            ),

            const SizedBox(height: 24),

            // Save Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primaryColor,
                  foregroundColor: ColorManager.textDark,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                onPressed: () => widget.onLanguageSelected(_selected),
                child: const Text(
                  'حفظ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Cancel
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'إلغاء',
                style: TextStyle(fontSize: 14, color: ColorManager.textMuted),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageTile({
    required String title,
    required String subtitle,
    required String badgeText,
    required String value,
  }) {
    final isSelected = _selected == value;
    return GestureDetector(
      onTap: () => setState(() => _selected = value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: ColorManager.cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? ColorManager.blueLink
                : ColorManager.borderLight,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? ColorManager.blueLink : ColorManager.textHint,
              size: 22,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.textDark,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ColorManager.textMuted,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: ColorManager.cardBackgroundLight,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? ColorManager.blueLink.withValues(alpha: 0.5)
                      : ColorManager.borderColor,
                ),
              ),
              child: Center(
                child: Text(
                  badgeText,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: isSelected
                        ? ColorManager.blueLink
                        : ColorManager.textMuted,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

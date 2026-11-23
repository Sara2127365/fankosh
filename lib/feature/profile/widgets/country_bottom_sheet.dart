import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class CountryBottomSheet extends StatefulWidget {
  final String selectedCountry;
  final Function(String country) onCountrySelected;

  const CountryBottomSheet({
    super.key,
    required this.selectedCountry,
    required this.onCountrySelected,
  });

  static Future<String?> show(BuildContext context, String currentCountry) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CountryBottomSheet(
        selectedCountry: currentCountry,
        onCountrySelected: (c) => Navigator.pop(context, c),
      ),
    );
  }

  @override
  State<CountryBottomSheet> createState() => _CountryBottomSheetState();
}

class _CountryBottomSheetState extends State<CountryBottomSheet> {
  late String _selected;
  String _searchQuery = '';

  final List<Map<String, String>> _countries = [
    {'name': 'مصر', 'flag': '🇪🇬'},
    {'name': 'السعودية', 'flag': '🇸🇦'},
    {'name': 'الإمارات', 'flag': '🇦🇪'},
    {'name': 'الكويت', 'flag': '🇰🇼'},
    {'name': 'قطر', 'flag': '🇶🇦'},
    {'name': 'البحرين', 'flag': '🇧🇭'},
    {'name': 'عُمان', 'flag': '🇴🇲'},
    {'name': 'الأردن', 'flag': '🇯🇴'},
    {'name': 'المغرب', 'flag': '🇲🇦'},
  ];

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedCountry;
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _countries
        .where((c) => c['name']!.contains(_searchQuery))
        .toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: ColorManager.cardBackground,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          children: [
            // Handle bar
            const SizedBox(height: 12),
            Container(
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: ColorManager.borderColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            // Header with Close Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 32),
                  const Column(
                    children: [
                      Text(
                        'اختار دولتك 🌍',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: ColorManager.textDark,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'اختار البلد اللي بتستخدم منها فانكوش.',
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorManager.textMuted,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
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
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: TextField(
                onChanged: (v) => setState(() => _searchQuery = v),
                decoration: InputDecoration(
                  hintText: 'ابحث عن دولة...',
                  hintStyle: const TextStyle(fontSize: 13, color: ColorManager.textHint),
                  prefixIcon: const Icon(Icons.search, color: ColorManager.textHint, size: 20),
                  filled: true,
                  fillColor: ColorManager.cardBackgroundLight,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Country List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                itemCount: filtered.length,
                separatorBuilder: (_, _) => const Divider(height: 1, color: ColorManager.dividerColor),
                itemBuilder: (context, index) {
                  final item = filtered[index];
                  final isSelected = item['name'] == _selected;
                  return InkWell(
                    onTap: () => setState(() => _selected = item['name']!),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Text(
                            item['flag']!,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            item['name']!,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                              color: ColorManager.textDark,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                            color: isSelected ? const Color(0xFF2F80ED) : ColorManager.textHint,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Save Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primaryColor,
                    foregroundColor: ColorManager.textDark,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                  ),
                  onPressed: () => widget.onCountrySelected(_selected),
                  child: const Text(
                    'حفظ التغييرات',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

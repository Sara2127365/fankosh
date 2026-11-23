import 'package:fankosh/core/style/color_manager.dart';
import 'package:flutter/material.dart';

class BirthdayWheelPicker extends StatefulWidget {
  final Function(int day, int month, int year) onDateChanged;

  const BirthdayWheelPicker({super.key, required this.onDateChanged});

  @override
  State<BirthdayWheelPicker> createState() => _BirthdayWheelPickerState();
}

class _BirthdayWheelPickerState extends State<BirthdayWheelPicker> {
  int _selectedDay = 14;
  int _selectedMonthIndex = 9; // October (0-indexed)
  int _selectedYear = 1998;

  final List<String> _arabicMonths = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];

  late FixedExtentScrollController _dayController;
  late FixedExtentScrollController _monthController;
  late FixedExtentScrollController _yearController;

  @override
  void initState() {
    super.initState();
    _dayController = FixedExtentScrollController(initialItem: _selectedDay - 1);
    _monthController = FixedExtentScrollController(
      initialItem: _selectedMonthIndex,
    );
    _yearController = FixedExtentScrollController(initialItem: 1998 - 1970);
  }

  @override
  void dispose() {
    _dayController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  void _notifyChange() {
    widget.onDateChanged(_selectedDay, _selectedMonthIndex + 1, _selectedYear);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: ColorManager.cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: ColorManager.borderLight),
      ),
      child: Column(
        children: [
          // Columns Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    'اليوم',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.textMuted,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'الشهر',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.textMuted,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'السنة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.textMuted,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Wheel Area with Highlight Overlay
          SizedBox(
            height: 180,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Golden Highlight Bar
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: ColorManager.badgeYellowBg,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: ColorManager.blueLink,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: ColorManager.blueLink,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 3 Wheels
                Row(
                  children: [
                    // Day Wheel
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        controller: _dayController,
                        itemExtent: 44,
                        perspective: 0.003,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (index) {
                          setState(() {
                            _selectedDay = index + 1;
                          });
                          _notifyChange();
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 31,
                          builder: (context, index) {
                            final isSelected = index + 1 == _selectedDay;
                            return Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontSize: isSelected ? 19 : 15,
                                  fontWeight: isSelected
                                      ? FontWeight.w900
                                      : FontWeight.w500,
                                  color: isSelected
                                      ? ColorManager.textDark
                                      : ColorManager.textHint.withValues(alpha: 0.6),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // Month Wheel
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        controller: _monthController,
                        itemExtent: 44,
                        perspective: 0.003,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (index) {
                          setState(() {
                            _selectedMonthIndex = index;
                          });
                          _notifyChange();
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: _arabicMonths.length,
                          builder: (context, index) {
                            final isSelected = index == _selectedMonthIndex;
                            return Center(
                              child: Text(
                                _arabicMonths[index],
                                style: TextStyle(
                                  fontSize: isSelected ? 18 : 14.5,
                                  fontWeight: isSelected
                                      ? FontWeight.w900
                                      : FontWeight.w500,
                                  color: isSelected
                                      ? ColorManager.textDark
                                      : ColorManager.textHint.withValues(alpha: 0.6),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // Year Wheel
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        controller: _yearController,
                        itemExtent: 44,
                        perspective: 0.003,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (index) {
                          setState(() {
                            _selectedYear = 1970 + index;
                          });
                          _notifyChange();
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 55, // 1970 to 2024
                          builder: (context, index) {
                            final year = 1970 + index;
                            final isSelected = year == _selectedYear;
                            return Center(
                              child: Text(
                                '$year',
                                style: TextStyle(
                                  fontSize: isSelected ? 19 : 15,
                                  fontWeight: isSelected
                                      ? FontWeight.w900
                                      : FontWeight.w500,
                                  color: isSelected
                                      ? ColorManager.textDark
                                      : ColorManager.textHint.withValues(alpha: 0.6),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Age Calculation Note
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cake_outlined,
                size: 16,
                color: ColorManager.blueLink,
              ),
              const SizedBox(width: 6),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: ColorManager.textMuted,
                  ),
                  children: [
                    const TextSpan(text: 'سيكون عمرك القادم '),
                    TextSpan(
                      text: '${2024 - _selectedYear} سنة',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.textDark,
                      ),
                    ),
                    const TextSpan(text: ' من الضحك والروقان'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

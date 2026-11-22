import 'package:fankosh/core/widgets/app_primary_button.dart';
import 'package:fankosh/feature/home/home_screen.dart';
import 'package:flutter/material.dart';

class PlanItem {
  final String title;
  final String? badge;
  final String? topBadge;
  final int price;
  final String duration;
  final String perk;
  final bool isPopular;

  const PlanItem({
    required this.title,
    this.badge,
    this.topBadge,
    required this.price,
    required this.duration,
    required this.perk,
    this.isPopular = false,
  });
}

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  int _selectedPlanIndex = 1; // Default to Fankosh Plus

  final List<PlanItem> _plans = const [
    PlanItem(
      title: 'فانكوش لايت',
      badge: 'الاوفر',
      price: 290,
      duration: '20 محاولة • صالحة لمدة 30 يوم',
      perk: '⚡ بحث أسرع وضحك اكتر',
    ),
    PlanItem(
      title: 'فانكوش بلس',
      topBadge: 'الأكثر اختياراً',
      price: 350,
      duration: '40 محاولة • صالحة لمدة 30 يوم',
      perk: '👑⚡ بحث أسرع وافيهات اكتر',
      isPopular: true,
    ),
    PlanItem(
      title: 'فانكوش برو',
      price: 599,
      duration: '100 محاولة • صالحة لمدة 30 يوم',
      perk: '⚡ بحث أسرع',
    ),
  ];

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFCFAF5),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Header Row with Logo and Skip
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 60), // balance spacing
                    Image.asset(
                      'assets/images/fankosh_logo.png',
                      width: 140,
                      fit: BoxFit.contain,
                    ),
                    TextButton(
                      onPressed: _navigateToHome,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'تخطي الآن',
                        style: TextStyle(
                          color: Color(0xFFE56969),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Main Title
                const Text(
                  'اختار باقتك وكمّل القفشات! 🎬',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E2833),
                  ),
                ),

                const SizedBox(height: 8),

                // Subtitle
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'جرّب فانكوش مجانًا، أو اختار باقتك واستمتع بقفشات أكثر!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7E8A9A),
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Subscription Plan Cards
                ...List.generate(_plans.length, (index) {
                  final plan = _plans[index];
                  final isSelected = index == _selectedPlanIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPlanIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFFFBE26)
                              : const Color(0xFFE8ECF2),
                          width: isSelected ? 2.0 : 1.0,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: const Color(0xFFFFBE26).withOpacity(0.12),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                            : null,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (plan.topBadge != null)
                                  const SizedBox(height: 10),

                                // Title, Badge, and Price
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Title & Badge
                                    Row(
                                      children: [
                                        Text(
                                          plan.title,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1E2833),
                                          ),
                                        ),
                                        if (plan.badge != null) ...[
                                          const SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF0F3F7),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Text(
                                              plan.badge!,
                                              style: const TextStyle(
                                                fontSize: 11,
                                                color: Color(0xFF7E8A9A),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),

                                    // Price
                                    Row(
                                      children: [
                                        Text(
                                          '${plan.price}',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: isSelected && plan.isPopular
                                                ? const Color(0xFFE5A100)
                                                : const Color(0xFF1E2833),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          'جنيه',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: isSelected && plan.isPopular
                                                ? const Color(0xFFE5A100)
                                                : const Color(0xFF7E8A9A),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 6),

                                // Duration
                                Text(
                                  plan.duration,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF7E8A9A),
                                  ),
                                ),

                                const SizedBox(height: 12),

                                // Perk
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    plan.perk,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: isSelected && plan.isPopular
                                          ? const Color(0xFFC78300)
                                          : const Color(0xFF9AA4B2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Top-left Amber Badge for Popular / Recommended
                          if (plan.topBadge != null)
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFBE26),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(14),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 13,
                                      color: Color(0xFF1E2833),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      plan.topBadge!,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1E2833),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }),

                const SizedBox(height: 16),

                // Primary CTA: متابعة للدفع (350 ج)
                AppPrimaryButton(
                  text:
                      'متابعة للدفع (${_plans[_selectedPlanIndex].price} ج)',
                  icon: Icons.arrow_back,
                  onPressed: _navigateToHome,
                ),

                const SizedBox(height: 12),

                // Secondary CTA: جرّب فانكوش مجانًا
                SizedBox(
                  height: 52,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF1E2833),
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFFE2E6EE)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: _navigateToHome,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'جرّب فانكوش مجانًا',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E2833),
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(
                          Icons.chevron_left,
                          size: 20,
                          color: Color(0xFF1E2833),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

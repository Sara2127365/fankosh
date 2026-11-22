import 'package:fankosh/feature/plans/plans_screen.dart';
import 'package:flutter/material.dart';

void showAttemptsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => const AttemptsBottomSheet(),
  );
}

class AttemptsBottomSheet extends StatelessWidget {
  const AttemptsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 12,
          bottom: 32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag Handle
            Center(
              child: Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E6EE),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Close Button (at top-left in RTL)
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF0F3F7),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 18,
                    color: Color(0xFF7E8A9A),
                  ),
                ),
              ),
            ),

            // Glowing Thunderbolt Icon
            Center(
              child: Container(
                width: 78,
                height: 78,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFFF2C2).withOpacity(0.55),
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFFFCA28), Color(0xFFFFB300)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFFB300).withOpacity(0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      '⚡',
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Title with bolt icon
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '⚡',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(width: 4),
                Text(
                  'محاولاتك في فانكوش',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E2833),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            // Subtitle with highlighted count
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7E8A9A),
                  fontFamily: 'inherit',
                ),
                children: [
                  TextSpan(text: 'فاضلك '),
                  TextSpan(
                    text: '3',
                    style: TextStyle(
                      color: Color(0xFFFF9800),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(text: ' محاولات مجانية'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Attempts Card with 3 Available Steps
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFDF5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFFFE8A3),
                  width: 1.2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Step 3 (Left in RTL)
                  _buildAttemptStep(number: '3', status: 'متاحة'),

                  // Connecting Line
                  Expanded(
                    child: Container(
                      height: 2,
                      margin: const EdgeInsets.only(bottom: 24),
                      color: const Color(0xFFFFE599),
                    ),
                  ),

                  // Step 2
                  _buildAttemptStep(number: '2', status: 'متاحة'),

                  // Connecting Line
                  Expanded(
                    child: Container(
                      height: 2,
                      margin: const EdgeInsets.only(bottom: 24),
                      color: const Color(0xFFFFE599),
                    ),
                  ),

                  // Step 1 (Right in RTL)
                  _buildAttemptStep(number: '1', status: 'متاحة'),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Blue Outlined Button ("اكتشف الباقات ‹")
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF299BF5),
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    color: Color(0xFF299BF5),
                    width: 1.8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context); // close bottom sheet
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
                    Icon(
                      Icons.chevron_left_rounded,
                      size: 22,
                      color: Color(0xFF299BF5),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'اكتشف الباقات',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF299BF5),
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
  }

  Widget _buildAttemptStep({required String number, required String status}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFFFC02E),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFFC02E).withOpacity(0.35),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E2833),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          status,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFFB57000),
          ),
        ),
      ],
    );
  }
}

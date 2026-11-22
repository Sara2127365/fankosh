import 'package:fankosh/feature/home/widgets/attempts_bottom_sheet.dart';
import 'package:fankosh/feature/plans/plans_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentTab = 0;
  bool _isRecording = false;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _toggleRecording() {
    setState(() {
      _isRecording = !_isRecording;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isRecording
              ? 'جاري الاستماع... اتكلم وفانكوش هيرد بإفيه! 🎙️'
              : 'تم حفظ المقطع! جاري تحضير الإفيه الجامد... ✨',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFCFAF5),
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              // Scrollable Content
              Positioned.fill(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 110, // padding for floating bottom nav
                  ),
                  child: Column(
                    children: [
                      // Top Custom App Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Notifications Bell
                          IconButton(
                            icon: const Icon(
                              Icons.notifications_none_outlined,
                              color: Color(0xFF1E2833),
                              size: 26,
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('لا توجد إشعارات جديدة حالياً'),
                                ),
                              );
                            },
                          ),

                          // App Logo
                          Image.asset(
                            'assets/images/fankosh_logo.png',
                            height: 42,
                            fit: BoxFit.contain,
                          ),

                          // Profile Icon
                          IconButton(
                            icon: const Icon(
                              Icons.account_circle_outlined,
                              color: Color(0xFF1E2833),
                              size: 28,
                            ),
                            onPressed: () {
                              setState(() {
                                _currentTab = 2;
                              });
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Attempts Counter Badge (⚡ 3 محاولات)
                      GestureDetector(
                        onTap: () {
                          showAttemptsBottomSheet(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF3CD),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFFFE082),
                              width: 1,
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '⚡',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(width: 4),
                              Text(
                                '3 محاولات',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF9E6C00),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Hero Character Illustration
                      Center(
                        child: Image.asset(
                          'assets/images/home_hero_character.png',
                          height: size.height * 0.22,
                          fit: BoxFit.contain,
                        ),
                      ),

                      // Speech Bubble
                      Transform.translate(
                        offset: const Offset(0, -10),
                        child: Image.asset(
                          'assets/images/speech_bubble.png',
                          width: size.width * 0.78,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Giant Glowing Record Button
                      GestureDetector(
                        onTap: _toggleRecording,
                        child: AnimatedBuilder(
                          animation: _pulseAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _isRecording ? _pulseAnimation.value : 1.0,
                              child: child,
                            );
                          },
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFFFF2C2).withOpacity(0.5),
                            ),
                            alignment: Alignment.center,
                            child: Container(
                              width: 106,
                              height: 106,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFFFDF70).withOpacity(0.7),
                              ),
                              alignment: Alignment.center,
                              child: Container(
                                width: 84,
                                height: 84,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: _isRecording
                                        ? [
                                            const Color(0xFFEF5350),
                                            const Color(0xFFE53935),
                                          ]
                                        : [
                                            const Color(0xFFFFCA28),
                                            const Color(0xFFFFB300),
                                          ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: (_isRecording
                                              ? Colors.red
                                              : const Color(0xFFFFB300))
                                          .withOpacity(0.4),
                                      blurRadius: 16,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Icon(
                                      _isRecording
                                          ? Icons.stop_rounded
                                          : Icons.mic_rounded,
                                      color: _isRecording
                                          ? Colors.white
                                          : const Color(0xFF1E2833),
                                      size: 38,
                                    ),
                                    if (!_isRecording)
                                      const Positioned(
                                        top: 18,
                                        right: 18,
                                        child: Icon(
                                          Icons.auto_awesome,
                                          color: Color(0xFF1E2833),
                                          size: 16,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Label below record button
                      Text(
                        _isRecording ? 'جاري التسجيل...' : 'أضغط لبدء التسجيل',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E2833),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Upload Audio Button ("أو ارفع مقطع صوتي ⭱")
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('اختر ملف صوتي من جهازك'),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: const Color(0xFFE2E6EE),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'أو ارفع مقطع صوتي',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF7E8A9A),
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.file_upload_outlined,
                                size: 18,
                                color: Color(0xFF7E8A9A),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),

              // Bottom Corner Decorations (Clapperboard & Film Reel)
              Positioned(
                bottom: 20,
                left: -15,
                child: IgnorePointer(
                  child: Image.asset(
                    'assets/images/clapperboard.png',
                    width: 140,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Positioned(
                bottom: 10,
                right: -10,
                child: IgnorePointer(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade400.withOpacity(0.6),
                      border: Border.all(color: Colors.grey.shade600, width: 4),
                    ),
                    child: Center(
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Floating Bottom Navigation Bar
              Positioned(
                left: 24,
                right: 24,
                bottom: 24,
                child: Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.92),
                    borderRadius: BorderRadius.circular(36),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Tab 0: الرئيسية (Home)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentTab = 0;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: _currentTab == 0
                                ? const Color(0xFFFFBE26)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.home_rounded,
                                size: 22,
                                color: _currentTab == 0
                                    ? Colors.white
                                    : const Color(0xFF7E8A9A),
                              ),
                              if (_currentTab == 0) ...[
                                const SizedBox(width: 6),
                                const Text(
                                  'الرئيسية',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),

                      // Tab 1: الباقات (Plans)
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PlansScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.bolt_outlined,
                                size: 22,
                                color: Color(0xFF7E8A9A),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'الباقات',
                                style: TextStyle(
                                  color: Color(0xFF7E8A9A),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Tab 2: حسابي (Profile)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentTab = 2;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('صفحة الحساب الشخصي'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.person_outline_rounded,
                                size: 22,
                                color: _currentTab == 2
                                    ? const Color(0xFFFFBE26)
                                    : const Color(0xFF7E8A9A),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'حسابي',
                                style: TextStyle(
                                  color: _currentTab == 2
                                      ? const Color(0xFFFFBE26)
                                      : const Color(0xFF7E8A9A),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
}

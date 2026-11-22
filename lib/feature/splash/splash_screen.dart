import 'dart:async';
import 'package:fankosh/feature/onboarding/onboarding_first_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _bottomSlideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _bottomSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _controller.forward();

    // Navigate to OnboardingFirstScreen after 2.8 seconds
    Timer(const Duration(milliseconds: 2800), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OnboardingFirstScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/splash_bg.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFF7CF),
                      Color(0xFFFFDFD3),
                      Color(0xFFE4F9F5),
                      Color(0xFFD4F0FC),
                    ],
                  ),
                ),
              );
            },
          ),

          // Upper Centered Logo with Scale & Fade animation
          Positioned(
            top: size.height * 0.22,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Center(
                  child: Image.asset(
                    'assets/images/fankosh_logo.png',
                    width: size.width * 0.72,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          // Bottom Elements: Popcorn Bucket & Movie Clapperboard
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SlideTransition(
              position: _bottomSlideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SizedBox(
                  height: size.height * 0.42,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Movie Clapperboard (Bottom-Left)
                      Positioned(
                        bottom: 0,
                        left: -size.width * 0.05,
                        child: Image.asset(
                          'assets/images/clapperboard.png',
                          width: size.width * 0.62,
                          fit: BoxFit.contain,
                        ),
                      ),

                      // Popcorn Bucket (Bottom-Right)
                      Positioned(
                        bottom: size.height * 0.02,
                        right: 0,
                        child: Image.asset(
                          'assets/images/popcorn_bucket.png',
                          width: size.width * 0.52,
                          fit: BoxFit.contain,
                        ),
                      ),

                      // Floating Popcorn Kernel
                      Positioned(
                        bottom: size.height * 0.03,
                        left: size.width * 0.46,
                        child: Image.asset(
                          'assets/images/popcorn_kernel.png',
                          width: 48,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:fankosh/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Fankosh());
}

class Fankosh extends StatelessWidget {
  const Fankosh({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

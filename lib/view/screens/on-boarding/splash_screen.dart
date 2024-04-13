import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showTagline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  ' DevSync',
                  curve: Curves.decelerate,
                  textStyle: Theme.of(context).textTheme.headlineLarge!,
                  speed: const Duration(milliseconds: 200),
                ),
              ],
              onFinished: () {
                setState(() {
                  _showTagline = true;
                });
              },
              isRepeatingAnimation: false,
              displayFullTextOnTap: true,
            ),
            if (_showTagline)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  displayFullTextOnTap: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Sync your code with your team',
                      textStyle: Theme.of(context).textTheme.bodyMedium!,
                      curve: Curves.decelerate,
                      textAlign: TextAlign.center,
                      cursor: "",
                      speed: const Duration(milliseconds: 30),
                    ),
                  ],
                  onFinished: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

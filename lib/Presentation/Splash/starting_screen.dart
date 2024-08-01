import 'package:bingo/Core/colors/color.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kthemecolor,
        body: Center(child: Container(height: 100, width: 100, color: kWhite)));
  }
}

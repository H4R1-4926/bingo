import 'package:bingo/Core/colors/color.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: kthemecolor,
        body: Center(
          child: Text(
            '3...2...1...Go',
            style: TextStyle(
                color: kWhite, fontSize: 42, fontWeight: FontWeight.bold),
          ),
        ));
  }
}

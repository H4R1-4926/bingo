import 'package:bingo/Core/colors/color.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      appBar: AppBar(
        backgroundColor: kPrimaryGreen,
        surfaceTintColor: kPrimaryGreen,
        automaticallyImplyLeading: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(image: AssetImage('assets/img/Logo.png')),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.09,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/bingo strips.png'))),
          ),
        ],
      ),
    );
  }
}

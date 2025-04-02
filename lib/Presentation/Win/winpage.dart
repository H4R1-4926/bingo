import 'dart:async';

import 'package:bingo/Application/GameBlocs/game_bloc.dart';
import 'package:bingo/Core/colors/color.dart';
import 'package:bingo/Presentation/GamePage/gamepage.dart';
import 'package:bingo/Presentation/Homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Win extends StatefulWidget {
  const Win({super.key});

  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {
  bool _isExpanded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _startAnimation();
  }

  void _startAnimation() {
    Timer(const Duration(milliseconds: 900), () {
      setState(() {
        _isExpanded = !_isExpanded;
      });

      _startAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
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
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Center(
                  child: Image(
                image: AssetImage('assets/img/Logo.png'),
              )),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context.read<GameBloc>().add(const Reset());
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const GamePage(),
                          ),
                        );
                      },
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(kDarkGreen),
                          foregroundColor: WidgetStatePropertyAll(kWhite),
                          fixedSize: WidgetStatePropertyAll(Size(240, 40))),
                      child: const Text(
                        'Rematch',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<GameBloc>().add(const Reset());
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homepage()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(kPrimaryGreen),
                          foregroundColor: WidgetStatePropertyAll(kblack),
                          fixedSize: WidgetStatePropertyAll(Size(240, 40))),
                      child: const Text(
                        'Home',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

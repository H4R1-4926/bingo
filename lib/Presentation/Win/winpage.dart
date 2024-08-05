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
      backgroundColor: kthemecolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              const SizedBox(
                height: 300,
                width: double.infinity,
              ),
              Center(
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  width: _isExpanded ? 180.0 : 150.0,
                  height: _isExpanded ? 180.0 : 150.0,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img/bingo.png'))),
                ),
              ),
            ],
          ),
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
                  backgroundColor: WidgetStatePropertyAll(kred),
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
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                  (Route<dynamic> route) => false,
                );
              },
              style: const ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Color.fromARGB(255, 252, 208, 10)),
                  foregroundColor: WidgetStatePropertyAll(kblack),
                  fixedSize: WidgetStatePropertyAll(Size(240, 40))),
              child: const Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}

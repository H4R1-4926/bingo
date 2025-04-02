import 'package:bingo/Application/Splash/splash_bloc.dart';
import 'package:bingo/Core/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashBloc>().add(const SplashEvent.started());
    });
    String displayText = '';
    return Scaffold(
        backgroundColor: kblack,
        body: Stack(
          children: [
            const Center(
                child: Image(
              image: AssetImage('assets/img/bingo.jpg'),
              opacity: AlwaysStoppedAnimation(0.09),
            )),
            Center(
              child: BlocBuilder<SplashBloc, SplashState>(
                builder: (context, state) {
                  if (state.loading) {
                    displayText = '${state.count}';
                  } else if (state.loaded) {
                    displayText = 'Go!!';
                  } else {
                    displayText = '3';
                  }
                  return Text(
                    displayText,
                    style: const TextStyle(
                        color: kPrimaryGreen,
                        fontSize: 42,
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

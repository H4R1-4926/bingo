import 'package:bingo/Application/GameBlocs/game_bloc.dart';
import 'package:bingo/Application/Splash/splash_bloc.dart';
import 'package:bingo/Core/colors/color.dart';
import 'package:bingo/Presentation/Splash/starting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GameBloc>().add(const GameEvent.started());
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashBloc>().add(const SplashEvent.started());
    });
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        if (state.loading) {
          return const SplashScreen();
        }
        return Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: kred,
                    ))
              ],
              automaticallyImplyLeading: false,
            ),
            backgroundColor: kthemecolor,
            body: BlocBuilder<GameBloc, GameState>(
              builder: (context, state) {
                final numbers = state.numbers;
                final bingo = state.bingoLetters;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 25,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 8,
                                mainAxisExtent: 90,
                                crossAxisSpacing: 8,
                                crossAxisCount: 5),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.read<GameBloc>().add(Mark(index: index));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: state.isClicked[index]
                                        ? kred
                                        : klighttheme,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Center(
                                  child: Text(
                                    state.isClicked[index]
                                        ? 'X'
                                        : numbers[index],
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 255, 53, 53),
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          );
                        },
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color:
                                        bingo[i] ? Colors.green : klighttheme,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 120,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    'BINGO'[i],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 80,
                                        color:
                                            Color.fromARGB(255, 255, 255, 0)),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ));
      },
    );
  }
}

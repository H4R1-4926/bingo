import 'dart:developer';

import 'package:bingo/Application/GameBlocs/game_bloc.dart';
import 'package:bingo/Application/Splash/splash_bloc.dart';
import 'package:bingo/Core/colors/color.dart';
import 'package:bingo/Presentation/Homepage/home.dart';
import 'package:bingo/Presentation/Splash/starting_screen.dart';
import 'package:bingo/Presentation/Win/winpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GameBloc>().add(const GameEvent.started());
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
                    onPressed: () {
                      showMenu(
                          color: klighttheme,
                          surfaceTintColor: klighttheme,
                          context: context,
                          position:
                              const RelativeRect.fromLTRB(75, 90, 045, 075),
                          items: [
                            PopupMenuItem(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          backgroundColor: klighttheme,
                                          title: const Center(
                                              child: Text(
                                            'You want to quit?',
                                            style: TextStyle(
                                                fontSize: 17, color: kWhite),
                                          )),
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                style: const ButtonStyle(
                                                    backgroundColor:
                                                        WidgetStatePropertyAll(
                                                            Colors.redAccent)),
                                                child: const Text(
                                                  'No',
                                                  style:
                                                      TextStyle(color: kWhite),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Homepage(),
                                                      ),
                                                      (Route<dynamic> route) =>
                                                          false);
                                                },
                                                style: const ButtonStyle(
                                                    backgroundColor:
                                                        WidgetStatePropertyAll(
                                                            Colors.redAccent)),
                                                child: const Text('Yes',
                                                    style: TextStyle(
                                                        color: kWhite)),
                                              ),
                                            ],
                                          ));
                                    },
                                  );
                                },
                                child: const Text(
                                  'Home',
                                  style: TextStyle(color: kWhite),
                                ))
                          ]);
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: kred,
                    ))
              ],
              automaticallyImplyLeading: false,
            ),
            backgroundColor: kthemecolor,
            body: BlocConsumer<GameBloc, GameState>(
              listener: (context, state) {
                if (state.winnibgCombs.where((element) => element).length > 4) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Win(),
                  ));
                }
              },
              builder: (context, state) {
                final numbers = state.numbers;

                log(state.winnibgCombs.toString());

                // Count the number of true values in winningCombs
                int trueCount =
                    state.winnibgCombs.where((element) => element).length;

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
                              if (!state.isClicked[index]) {
                                context
                                    .read<GameBloc>()
                                    .add(Mark(index: index));
                              }
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
                      child: Row(children: [
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color:
                                    trueCount > 0 ? Colors.green : klighttheme,
                                borderRadius: BorderRadius.circular(10)),
                            height: 120,
                            width: 100,
                            child: const Center(
                              child: Text(
                                'B',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 80,
                                    color: Color.fromARGB(255, 255, 255, 0)),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color:
                                    trueCount > 1 ? Colors.green : klighttheme,
                                borderRadius: BorderRadius.circular(10)),
                            height: 120,
                            width: 100,
                            child: const Center(
                              child: Text(
                                'I',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 80,
                                    color: Color.fromARGB(255, 255, 255, 0)),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color:
                                    trueCount > 2 ? Colors.green : klighttheme,
                                borderRadius: BorderRadius.circular(10)),
                            height: 120,
                            width: 100,
                            child: const Center(
                              child: Text(
                                'N',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 80,
                                    color: Color.fromARGB(255, 255, 255, 0)),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color:
                                    trueCount > 3 ? Colors.green : klighttheme,
                                borderRadius: BorderRadius.circular(10)),
                            height: 120,
                            width: 100,
                            child: const Center(
                              child: Text(
                                'G',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 80,
                                    color: Color.fromARGB(255, 255, 255, 0)),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color:
                                    trueCount > 4 ? Colors.green : klighttheme,
                                borderRadius: BorderRadius.circular(10)),
                            height: 120,
                            width: 100,
                            child: const Center(
                              child: Text(
                                'O',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 80,
                                    color: Color.fromARGB(255, 255, 255, 0)),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    )
                  ],
                );
              },
            ));
      },
    );
  }
}

import 'package:bingo/Application/bloc/game_bloc.dart';
import 'package:bingo/Core/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GameBloc>().add(const GameEvent.started());
    return Scaffold(
      backgroundColor: kthemecolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width / 1.2,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 25,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      mainAxisExtent: 90,
                      crossAxisSpacing: 8,
                      crossAxisCount: 5),
                  itemBuilder: (context, index) {
                    return BlocBuilder<GameBloc, GameState>(
                      builder: (context, state) {
                        final numbers = state.numbers;
                        return Container(
                          color: klighttheme,
                          child: Center(
                            child: Text(
                              numbers[index],
                              style: TextStyle(color: kWhite),
                            ),
                          ),
                        );
                      },
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}

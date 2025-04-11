import 'dart:developer';

import 'package:bingo/Application/Advertisemnet/ad_bloc.dart';
import 'package:bingo/Application/GameBlocs/game_bloc.dart';
import 'package:bingo/Application/Splash/splash_bloc.dart';
import 'package:bingo/Core/colors/color.dart';
import 'package:bingo/Presentation/Homepage/home.dart';
import 'package:bingo/Presentation/Splash/starting_screen.dart';
import 'package:bingo/Presentation/Win/winpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GameBloc>().add(const GameEvent.started());
      context.read<SplashBloc>().add(const SplashEvent.started());
    });
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<AdBloc>().add(const AdEvent.started());
      },
    );

    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        if (state.loading) {
          return const SplashScreen();
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            surfaceTintColor: kPrimaryColor,
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(image: AssetImage('assets/img/bingo.jpg')),
            ),
            actions: [
              PopupMenuButton(
                color: kPrimaryColor,
                surfaceTintColor: kPrimaryColor,
                icon: const Icon(
                  Icons.more_vert,
                  size: 28,
                  color: kblack,
                ),
                onSelected: (value) {
                  if (value == '1') {
                    context.read<GameBloc>().add(const Reset());
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const GamePage(),
                      ),
                    );
                  } else if (value == '2') {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            backgroundColor: kPrimaryColor,
                            title: const Center(
                                child: Text(
                              'You want to quit?',
                              style: TextStyle(fontSize: 17, color: kblack),
                            )),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          kSecondaryColor)),
                                  child: const Text(
                                    'No',
                                    style: TextStyle(color: kWhite),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<AdBloc>()
                                        .add(const AdEvent.interstatial());

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Homepage(),
                                        ),
                                        (Route<dynamic> route) => false);
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          kSecondaryColor)),
                                  child: const Text('Yes',
                                      style: TextStyle(color: kWhite)),
                                ),
                              ],
                            ));
                      },
                    );
                  }
                },
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      textStyle: TextStyle(color: kblack, fontSize: 20),
                      value: '1',
                      child: Center(child: Text('Restart')),
                    ),
                    const PopupMenuItem(
                      textStyle: TextStyle(color: kblack, fontSize: 20),
                      value: '2',
                      child: Center(child: Text('Home')),
                    )
                  ];
                },
              )
            ],
            automaticallyImplyLeading: false,
          ),
          backgroundColor: kblack,
          body: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      backgroundColor: kPrimaryColor,
                      title: const Center(
                          child: Text(
                        'You want to quit?',
                        style: TextStyle(fontSize: 17, color: kblack),
                      )),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(kSecondaryColor)),
                            child: const Text(
                              'No',
                              style: TextStyle(color: kWhite),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Homepage(),
                                  ),
                                  (Route<dynamic> route) => false);
                            },
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(kSecondaryColor)),
                            child: const Text('Yes',
                                style: TextStyle(color: kWhite)),
                          ),
                        ],
                      ));
                },
              );
            },
            child: BlocConsumer<GameBloc, GameState>(
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
                                        ? kPrimaryColor
                                        : kSecondaryColor,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Center(
                                  child: Text(
                                    state.isClicked[index]
                                        ? 'X'
                                        : numbers[index],
                                    style: TextStyle(
                                        color: state.isClicked[index]
                                            ? kblack
                                            : kWhite,
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
                                color: trueCount > 0
                                    ? kPrimaryColor
                                    : kSecondaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            height: 120,
                            width: 100,
                            child: Center(
                              child: Text(
                                'B',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 80,
                                    color: trueCount > 0 ? kblack : kWhite),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: trueCount > 1
                                    ? kPrimaryColor
                                    : kSecondaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            height: 120,
                            width: 100,
                            child: Center(
                              child: Text(
                                'I',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 80,
                                    color: trueCount > 1 ? kblack : kWhite),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: trueCount > 2
                                    ? kPrimaryColor
                                    : kSecondaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            height: 120,
                            width: 100,
                            child: Center(
                              child: Text(
                                'N',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 80,
                                    color: trueCount > 2 ? kblack : kWhite),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: trueCount > 3
                                    ? kPrimaryColor
                                    : kSecondaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            height: 120,
                            width: 100,
                            child: Center(
                              child: Text(
                                'G',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 80,
                                    color: trueCount > 3 ? kblack : kWhite),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: trueCount > 4
                                    ? kPrimaryColor
                                    : kSecondaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            height: 120,
                            width: 100,
                            child: Center(
                              child: Text(
                                'O',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 80,
                                    color: trueCount > 4 ? kblack : kWhite),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    )
                  ],
                );
              },
            ),
          ),
          bottomNavigationBar: BlocBuilder<AdBloc, AdState>(
            builder: (context, state) {
              if (state.ads == null) {
                return const SizedBox();
              }
              return SizedBox(
                height: state.ads!.size.height.toDouble(),
                width: state.ads!.size.width.toDouble(),
                child: AdWidget(ad: state.ads!),
              );
            },
          ),
        );
      },
    );
  }
}

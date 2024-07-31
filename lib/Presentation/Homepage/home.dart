import 'package:bingo/Core/colors/color.dart';
import 'package:bingo/Presentation/GamePage/gamepage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kthemecolor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: kred,
                size: 35,
              ))
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
                    image: AssetImage('assets/img/bg.jpg'))),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 180,
                  width: 320,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img/bingoTitle_1.png'))),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const GamePage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var tween = Tween(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ));
                    },
                    child: Lottie.asset('assets/lottie/play.json',
                        height: 200, width: 200))
              ],
            ),
          )
        ],
      ),
    );
  }
}

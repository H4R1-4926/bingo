import 'dart:developer';

import 'package:bingo/Core/colors/color.dart';
import 'package:bingo/Infrastructure/music/music.dart';
import 'package:bingo/Presentation/GamePage/gamepage.dart';
import 'package:bingo/Presentation/Privacy%20policy/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final Audio audio = Audio();
  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    _loadMuteState();
    audio.play();
  }

  void _loadMuteState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isMuted = prefs.getBool('isMuted') ?? false;
    });
    if (!isMuted) {
      audio.bgPlay();
    }
  }

  @override
  void dispose() {
    audio.dispose();
    super.dispose();
  }

  void toggleMuteButton() {
    setState(() {
      isMuted = !isMuted;
      if (isMuted) {
        audio.stopPlaying();
      } else {
        audio.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    log(isMuted.toString());
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kblack,
      appBar: AppBar(
        backgroundColor: kPrimaryGreen,
        surfaceTintColor: kPrimaryGreen,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assets/img/bingo.jpg')),
        ),
        actions: [
          IconButton(
              onPressed: toggleMuteButton,
              icon: Icon(
                isMuted ? Icons.volume_off : Icons.volume_up,
                color: kblack,
                size: 35,
              )),
          PopupMenuButton(
            color: kPrimaryGreen,
            surfaceTintColor: kPrimaryGreen,
            icon: const Icon(
              Icons.more_vert,
              size: 28,
              color: kblack,
            ),
            onSelected: (value) {
              if (value == '1') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyPage(),
                  ),
                );
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  textStyle: TextStyle(color: kblack, fontSize: 20),
                  value: '1',
                  child: Center(child: Text('Privacy Policy')),
                ),
              ];
            },
          )
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 180,
                  width: 320,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img/Logo.png'))),
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

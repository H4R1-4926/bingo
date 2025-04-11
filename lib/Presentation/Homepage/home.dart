import 'dart:developer';

import 'package:bingo/Application/Advertisemnet/ad_bloc.dart';
import 'package:bingo/Core/colors/color.dart';
import 'package:bingo/Infrastructure/music/music.dart';
import 'package:bingo/Presentation/GamePage/gamepage.dart';
import 'package:bingo/Presentation/Privacy%20policy/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isMuted = false;
  final Audio _audio = Audio();

  @override
  void initState() {
    super.initState();
    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
    await _audio.initialize();
    _audio.bgPlay();
    _updateMuteState();
  }

  Future<void> _updateMuteState() async {
    bool muted = await _audio.isMuted();
    setState(() => _isMuted = muted);
  }

  @override
  Widget build(BuildContext context) {
    log(_isMuted.toString());
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kblack,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        surfaceTintColor: kPrimaryColor,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assets/img/bingo.jpg')),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await _audio.toggleMute();
                _updateMuteState();
              },
              icon: Icon(
                _isMuted ? Icons.volume_off_outlined : Icons.volume_up_outlined,
                color: kblack,
                size: 35,
              )),
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyPage(),
                  ),
                );
                context.read<AdBloc>().add(const AdEvent.interstatial());
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
                    opacity: 0.2,
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

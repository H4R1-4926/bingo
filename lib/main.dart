import 'package:bingo/Application/GameBlocs/game_bloc.dart';
import 'package:bingo/Application/Splash/splash_bloc.dart';
import 'package:bingo/Presentation/Homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Audio.playMusic();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GameBloc(),
        ),
        BlocProvider(
          create: (context) => SplashBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}

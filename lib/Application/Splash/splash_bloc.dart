import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState.initital()) {
    on<_Started>((event, emit) async {
      int count = 3;

      while (count > 0) {
        emit(SplashState(loading: true, loaded: false, count: count));
        await Future.delayed(const Duration(milliseconds: 800));
        count--;
      }

      emit(const SplashState(loading: false, loaded: true, count: 0));
    });
  }
}

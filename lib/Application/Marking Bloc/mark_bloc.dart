import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mark_event.dart';
part 'mark_state.dart';
part 'mark_bloc.freezed.dart';

class MarkBloc extends Bloc<MarkEvent, MarkState> {
  MarkBloc() : super(MarkState.initial()) {
    on<_Started>((event, emit) {
      emit(MarkState(onTap: event.ontap));
    });
  }
}

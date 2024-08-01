part of 'mark_bloc.dart';

@freezed
class MarkState with _$MarkState {
  const factory MarkState({required bool onTap}) = _MarkState;
  factory MarkState.initial() {
    return const MarkState(onTap: false);
  }
}

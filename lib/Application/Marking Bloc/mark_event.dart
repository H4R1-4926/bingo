part of 'mark_bloc.dart';

@freezed
class MarkEvent with _$MarkEvent {
  const factory MarkEvent.started({required bool ontap}) = _Started;
}

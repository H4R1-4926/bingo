part of 'ad_bloc.dart';

@freezed
class AdEvent with _$AdEvent {
  const factory AdEvent.started() = Started;
  const factory AdEvent.interstatial() = _Interstatial;
}

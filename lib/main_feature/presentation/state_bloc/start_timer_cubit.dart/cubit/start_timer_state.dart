part of 'start_timer_cubit.dart';

@immutable
abstract class StartTimerState {}

final class StartTimerInitial extends StartTimerState {}

final class StartTimerDeleydText extends StartTimerState {}

final class StartTimerStarted extends StartTimerState {}

final class StartTimerRestTime extends StartTimerState {}

final class StartTimerFinish extends StartTimerState {}

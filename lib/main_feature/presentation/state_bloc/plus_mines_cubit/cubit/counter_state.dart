part of 'counter_cubit.dart';

@immutable
class CounterState {
  final int minTimeRound;
  final int secondTimeRound;
  final int minRestTime;
  final int secondRestTime;

  final int roundNumber;

  const CounterState(
      {required this.minTimeRound,
      required this.secondTimeRound,
      required this.minRestTime,
      required this.secondRestTime,
      required this.roundNumber});
}

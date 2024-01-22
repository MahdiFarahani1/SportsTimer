import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'start_timer_state.dart';

class StartTimerCubit extends Cubit<StartTimerState> {
  StartTimerCubit() : super(StartTimerInitial());

  showText() {
    emit(StartTimerDeleydText());
  }

  showTimer() async {
    await Future.delayed(const Duration(seconds: 1), () {}).then(
      (value) => emit(
        StartTimerStarted(),
      ),
    );
  }

  initState() {
    emit(StartTimerInitial());
  }

  restTime() {
    emit(StartTimerRestTime());
  }
}

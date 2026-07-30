import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_bording_state.dart';

class OnBordingCubit extends Cubit<OnBordingState> {
  OnBordingCubit() : super(OnBordingState());

  void changePage(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}

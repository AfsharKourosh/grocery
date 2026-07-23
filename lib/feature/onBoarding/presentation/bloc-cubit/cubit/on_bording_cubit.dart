import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'on_bording_state.dart';

class OnBordingCubit extends Cubit<OnBordingState> {
  OnBordingCubit() : super(OnBordingInitial());
}

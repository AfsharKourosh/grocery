part of 'on_bording_cubit.dart';

class OnBordingState extends Equatable {
  final int currentIndex;
  const OnBordingState({this.currentIndex = 0});

  OnBordingState copyWith({int? currentIndex}) {
    return OnBordingState(currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object?> get props => [currentIndex];
}

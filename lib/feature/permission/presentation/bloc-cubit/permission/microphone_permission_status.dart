import 'package:equatable/equatable.dart';

sealed class MicrophonePermissionStatus extends Equatable {
  const MicrophonePermissionStatus();
  @override
  List<Object?> get props => [];
}

final class MicrophonePermissionInitial extends MicrophonePermissionStatus {}

final class MicrophonePermissionGranted extends MicrophonePermissionStatus {}

final class MicrophonePermissionDenied extends MicrophonePermissionStatus {}

final class MicrophonePermissionPermanentlyDenied
    extends MicrophonePermissionStatus {}

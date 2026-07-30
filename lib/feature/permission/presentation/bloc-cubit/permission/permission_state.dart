part of 'permission_cubit.dart';

class PermissionState extends Equatable {
  final CameraPermissionStatus cameraPermissionStatus;
  final MicrophonePermissionStatus microphonePermissionStatus;
  const PermissionState({
    required this.cameraPermissionStatus,
    required this.microphonePermissionStatus,
  });

  PermissionState copyWith({
    CameraPermissionStatus? cameraPermissionStatus,
    MicrophonePermissionStatus? microphonePermissionStatus,
  }) {
    return PermissionState(
      cameraPermissionStatus:
          cameraPermissionStatus ?? this.cameraPermissionStatus,
      microphonePermissionStatus:
          microphonePermissionStatus ?? this.microphonePermissionStatus,
    );
  }

  @override
  List<Object?> get props => [
    cameraPermissionStatus,
    microphonePermissionStatus,
  ];
}

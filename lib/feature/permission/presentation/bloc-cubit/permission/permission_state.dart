part of 'permission_cubit.dart';

class PermissionState extends Equatable {
  final CameraPermissionStatus cameraPermissionStatus;
  final MicrophonePermissionStatus microphonePermissionStatus;
  const PermissionState({
    required this.cameraPermissionStatus,
    required this.microphonePermissionStatus,
  });

  PermissionState copyWith({
    CameraPermissionStatus? newCameraPermissionStaus,
    MicrophonePermissionStatus? newMicrophonePermissionStaus,
  }) {
    return PermissionState(
      cameraPermissionStatus:
          newCameraPermissionStaus ?? cameraPermissionStatus,
      microphonePermissionStatus:
          newMicrophonePermissionStaus ?? microphonePermissionStatus,
    );
  }

  @override
  List<Object?> get props => [
    cameraPermissionStatus,
    microphonePermissionStatus,
  ];
}

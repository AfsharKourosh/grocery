part of 'permission_cubit.dart';

class PermissionState extends Equatable {
  final CameraPermissionStatus cameraPermissionStatus;

  const PermissionState({required this.cameraPermissionStatus});

  PermissionState copyWith({CameraPermissionStatus? newCameraPermissionStaus}) {
    return PermissionState(
      cameraPermissionStatus:
          newCameraPermissionStaus ?? cameraPermissionStatus,
    );
  }

  @override
  List<Object?> get props => [cameraPermissionStatus];
}

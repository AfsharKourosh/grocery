part of 'permission_cubit.dart';

sealed class PermissionState {
  const PermissionState();
}

final class PermissionInitial extends PermissionState {
  const PermissionInitial();
}

final class PermissionLoading extends PermissionState {
  const PermissionLoading();
}

final class CameraPermissionGranted extends PermissionState {
  const CameraPermissionGranted();
}

final class CameraPermissionDenied extends PermissionState {
  const CameraPermissionDenied();
}

final class CameraPermissionPermanentlyDenied extends PermissionState {
  const CameraPermissionPermanentlyDenied();
}

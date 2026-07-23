import 'package:equatable/equatable.dart';

sealed class CameraPermissionStatus extends Equatable {
  const CameraPermissionStatus();
  @override
  List<Object?> get props => [];
}

final class CameraPermissionInitial extends CameraPermissionStatus {}

final class CameraPermissionGranted extends CameraPermissionStatus {}

final class CameraPermissionDenied extends CameraPermissionStatus {}

final class CameraPermissionPermanentlyDenied extends CameraPermissionStatus {}

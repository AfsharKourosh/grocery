import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/core/storage/app_storage.dart';
import 'package:grocery/feature/permission/presentation/bloc-cubit/permission/microphone_permission_status.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:grocery/feature/permission/presentation/bloc-cubit/permission/camera_permission_status.dart';

part 'permission_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit()
    : super(
        PermissionState(
          cameraPermissionStatus: CameraPermissionInitial(),
          microphonePermissionStatus: MicrophonePermissionInitial(),
        ),
      );

  Future<void> requestCameraPermission() async {
    final currentStatus = await Permission.camera.status;
    final requestPermission = await Permission.camera.request();

    if (currentStatus.isGranted) {
      AppStorage.cameraGranted;

      emit(state.copyWith(newCameraPermissionStaus: CameraPermissionGranted()));
      return;
    }

    if (requestPermission.isGranted) {
      AppStorage.setCameraGranted();

      emit(state.copyWith(newCameraPermissionStaus: CameraPermissionGranted()));
    } else if (requestPermission.isPermanentlyDenied) {
      emit(
        state.copyWith(
          newCameraPermissionStaus: CameraPermissionPermanentlyDenied(),
        ),
      );
    } else {
      emit(state.copyWith(newCameraPermissionStaus: CameraPermissionDenied()));
    }
  }

  Future<void> requestMicrophonePermission() async {
    final currentStatus = await Permission.microphone.status;
    final requestPermission = await Permission.microphone.request();
    if (currentStatus.isGranted) {
      AppStorage.microphoneGranted;
      emit(
        state.copyWith(
          newMicrophonePermissionStaus: MicrophonePermissionGranted(),
        ),
      );
      return;
    }
    if (requestPermission.isGranted) {
      AppStorage.setMicrophoneGranted();
      emit(
        state.copyWith(
          newMicrophonePermissionStaus: MicrophonePermissionGranted(),
        ),
      );
    } else if (requestPermission.isPermanentlyDenied) {
      emit(
        state.copyWith(
          newMicrophonePermissionStaus: MicrophonePermissionPermanentlyDenied(),
        ),
      );
    } else {
      emit(
        state.copyWith(
          newMicrophonePermissionStaus: MicrophonePermissionDenied(),
        ),
      );
    }
  }
}

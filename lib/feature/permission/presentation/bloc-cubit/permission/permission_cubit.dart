import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/core/storage/app_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:grocery/feature/permission/presentation/bloc-cubit/permission/camera_permission_status.dart';

part 'permission_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit()
    : super(PermissionState(cameraPermissionStatus: CameraPermissionInitial()));

  Future<void> requestCameraPermission() async {
    emit(state.copyWith(newCameraPermissionStaus: CameraPermissionLoading()));

    final currentStatus = Permission.camera;

    if (await currentStatus.status.isGranted) {
      AppStorage.setCameraGranted();

      emit(state.copyWith(newCameraPermissionStaus: CameraPermissionGranted()));
      return;
    }

    if (await currentStatus.request().isGranted) {
      AppStorage.setCameraGranted();

      emit(state.copyWith(newCameraPermissionStaus: CameraPermissionGranted()));
    } else if (await currentStatus.request().isPermanentlyDenied) {
      emit(
        state.copyWith(
          newCameraPermissionStaus: CameraPermissionPermanentlyDenied(),
        ),
      );
    } else {
      emit(state.copyWith(newCameraPermissionStaus: CameraPermissionDenied()));
    }
  }


}

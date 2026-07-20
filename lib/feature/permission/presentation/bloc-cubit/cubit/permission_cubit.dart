import 'package:bloc/bloc.dart';
import 'package:grocery/core/storage/app_storage.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(PermissionInitial());

  Future<void> requestCameraPermission() async {
    emit(const PermissionLoading());

    final currentStatus = await Permission.camera.status;

    if (currentStatus.isGranted) {
      AppStorage.setCameraGranted();

      emit(const CameraPermissionGranted());
      return;
    }

    final status = await Permission.camera.request();

    if (status.isGranted) {
      AppStorage.setCameraGranted();

      emit(const CameraPermissionGranted());
    } else if (status.isPermanentlyDenied) {
      emit(const CameraPermissionPermanentlyDenied());
    } else {
      emit(const CameraPermissionDenied());
    }
  }
}

import 'package:get_storage/get_storage.dart';

class AppStorage {
  static final _box = GetStorage();
  //keys
  static const _cameraPermissionAllowed = 'camera-permission-allowed';
  static const _microphonePermissionAllowed = 'microphone-permission-allowed';

  ///permissions

  //camere
  static bool get cameraGranted  =>
      _box.read<bool>(_cameraPermissionAllowed) ?? false;

  static void setCameraGranted() =>
      _box.write(_cameraPermissionAllowed, true);

  //microphone
  static bool get microphoneGranted  =>
      _box.read<bool>(_microphonePermissionAllowed) ?? false;

  static void setMicrophoneGranted() =>
      _box.write(_microphonePermissionAllowed, true);

  static void clearAll() => _box.erase();
}

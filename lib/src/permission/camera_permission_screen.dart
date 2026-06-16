import 'package:flutter/material.dart';
import 'package:grocery/config/theme/app_colors.dart';
import 'package:grocery/core/utils/app_images.dart';
import 'package:grocery/src/permission/mic_permission.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermissionScreen extends StatefulWidget {
  const CameraPermissionScreen({super.key});

  @override
  State<CameraPermissionScreen> createState() => _CameraPermissionScreenState();
}

class _CameraPermissionScreenState extends State<CameraPermissionScreen> {
  late final PermissionStatus permissionStatus;

    Future<void> requestCameraPermission() async {
        // Check current status first
  final current = await Permission.camera.status;

  if (current.isGranted) {
    // Already granted, go straight to camera
    return;
  }

  final status = await Permission.camera.request();
  // handle status...

    setState(() => permissionStatus = status);

    if (status.isGranted) {
      // ✅ Open camera here
      print('Camera permission granted!');
    } else if (status.isDenied) {
      // User denied, can ask again
      print('Permission denied');
    } else if (status.isPermanentlyDenied) {
      // User tapped "Never ask again" → open settings
      openAppSettings();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SizedBox(width: double.infinity,
        child: Column(spacing: 12.0,mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.camera),
            ElevatedButton(onPressed: () {requestCameraPermission();
            Navigator.push(context, MaterialPageRoute(builder: (context) => MicPermission(),));}, child: Text('yes')),
            ElevatedButton(onPressed: () {openAppSettings();}, child: Text('no')),
          ],
        ),
      ),
    );
  }


}

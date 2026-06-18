import 'package:flutter/material.dart';
import 'package:grocery/config/theme/app_colors.dart';
import 'package:grocery/core/storage/app_storage.dart';
import 'package:grocery/core/utils/app_images.dart';
import 'package:grocery/src/permission/presentation/screens/microphone_permission_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermissionScreen extends StatefulWidget {
  const CameraPermissionScreen({super.key});

  @override
  State<CameraPermissionScreen> createState() => _CameraPermissionScreenState();
}

class _CameraPermissionScreenState extends State<CameraPermissionScreen> {
  PermissionStatus? permissionStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          spacing: 12.0,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.camera, height: 100.0),
            ElevatedButton(
              onPressed: () {
                requestCameraPermission();
              },
              child: Text('yes'),
            ),
            ElevatedButton(
              onPressed: () {
                openAppSettings();
              },
              child: Text('no'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> requestCameraPermission() async {
    // Check first before requesting
    final current = await Permission.camera.status;

    if (current.isGranted) {
      // Already granted — just save and navigate
      AppStorage.setMicrophoneGranted();
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MicrophonePermissionScreen()),
      );
      return; // stop here, don't request again
    }
    // Check current status first
    final status = await Permission.camera.request();
    setState(() => permissionStatus = status);
    // handle status...
    if (status.isGranted) {
      AppStorage.setCameraGranted();
      // save only when granted
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Camera permission is Granted!')));
      await Future.delayed(Duration(seconds: 1));
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MicrophonePermissionScreen()),
      );
    } else if (status.isDenied) {
      //  Denied → show snackbar, stay on screen
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Camera permission is required!')));
    } else if (status.isPermanentlyDenied) {
      // User tapped "Never ask again" → open settings
      openAppSettings();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:grocery/config/theme/app_colors.dart';
import 'package:grocery/core/utils/app_images.dart';
import 'package:permission_handler/permission_handler.dart';

class MicPermission extends StatefulWidget {
  const MicPermission({super.key});

  @override
  State<MicPermission> createState() => _MicPermissionState();
}

class _MicPermissionState extends State<MicPermission> {
late final  PermissionStatus? permissionStatus;

Future<void> requestMicPermission() async {
    // Check first
    final current = await Permission.microphone.status;

    if (current.isGranted) {
      setState(() => permissionStatus = current);
      return;
    }

    // Request
    final status = await Permission.microphone.request();
    setState(() => permissionStatus = status);

    if (status.isGranted) {
      print('Microphone granted!');
    } else if (status.isDenied) {
      print('Microphone denied');
    } else if (status.isPermanentlyDenied) {
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
            Image.asset(AppImages.mic),
            ElevatedButton(onPressed: () {requestMicPermission();}, child: Text('yes')),
            ElevatedButton(onPressed: () {openAppSettings();}, child: Text('no')),
          ],
        ),
      ),
    );
  }
}
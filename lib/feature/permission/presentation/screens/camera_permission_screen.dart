import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/app_constants.dart';
import 'package:grocery/feature/permission/presentation/bloc-cubit/permission/camera_permission_status.dart';
import 'package:grocery/feature/permission/presentation/bloc-cubit/permission/permission_cubit.dart';
import 'package:grocery/feature/permission/presentation/screens/microphone_permission_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermissionScreen extends StatelessWidget {
  const CameraPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PermissionCubit, PermissionState>(
      listener: (context, state) async {
        if (state.cameraPermissionStatus is CameraPermissionGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Camera permission is Granted!')),
          );
          await Future.delayed(const Duration(seconds: 1));

          if (!context.mounted) return;

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const MicrophonePermissionScreen(),
            ),
          );
        }
        if (state.cameraPermissionStatus is CameraPermissionDenied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Camera permission is required!')),
          );
        }

        if (state.cameraPermissionStatus is CameraPermissionPermanentlyDenied) {
          await openAppSettings();
        }
      },
      child: Scaffold(
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
                  context.read<PermissionCubit>().requestCameraPermission();
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
      ),
    );
  }
}

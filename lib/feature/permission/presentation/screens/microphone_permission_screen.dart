import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/app_constants.dart';
import 'package:grocery/feature/onBoarding/presentation/screens/onboarding_screen.dart';
import 'package:grocery/feature/permission/presentation/bloc-cubit/permission/microphone_permission_status.dart';
import 'package:grocery/feature/permission/presentation/bloc-cubit/permission/permission_cubit.dart';
import 'package:permission_handler/permission_handler.dart';

class MicrophonePermissionScreen extends StatelessWidget {
  const MicrophonePermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PermissionCubit, PermissionState>(
      listener: (context, state) async {
        if (state.microphonePermissionStatus is MicrophonePermissionGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Microphone permission is Granted!')),
          );
          await Future.delayed(const Duration(seconds: 1));
          if (!context.mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen()),
          );
        }
        if (state.microphonePermissionStatus is MicrophonePermissionDenied) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Microphone permission is required!')),
          );
        }
        if (state.microphonePermissionStatus
            is MicrophonePermissionPermanentlyDenied) {
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
              Image.asset(AppImages.mic, height: 100.0),
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

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                Pinput(
                  controller: TextEditingController(),
                  focusNode: FocusNode(),
                  length: 4,
                  enabled: true,
                  autofocus: false,
                  onChanged: (_) {},
                  onCompleted: (_) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

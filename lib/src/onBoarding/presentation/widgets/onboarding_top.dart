import 'package:flutter/material.dart';

class OnboardingTop extends StatelessWidget {
  const OnboardingTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      children: [
        Text('data', style: TextStyle(fontSize: 80.0)),
        Text('data', style: TextStyle(fontSize: 50.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20.0,
          children: [Text('data'), Text('data')],
        ),
        SizedBox(height: 8.0),
        Divider(color: Colors.black, thickness: 2.0),
      ],
    );
  }
}

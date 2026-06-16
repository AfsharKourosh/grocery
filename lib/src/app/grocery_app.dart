import 'package:flutter/material.dart';
import 'package:grocery/src/permission/camera_permission_screen.dart';
import 'package:grocery/src/splash/splash_screen.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: CameraPermissionScreen(),
      //  Scaffold(
      //   appBar: AppBar(
      //     backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      //     title: Text('widget.title'),
      //   ),
      //   body: Center(
      //     child: Column(
      //       mainAxisAlignment: .center,
      //       children: [
      //         const Text('You have pushed the button this many times:'),
      //         Text(
      //           'counter',
      //           style: Theme.of(context).textTheme.headlineMedium,
      //         ),
      //       ],
      //     ),
      //   ),
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () {},
      //     tooltip: 'Increment',
      //     child: const Icon(Icons.add),
      //   ),
      // ),
    );
  }
}

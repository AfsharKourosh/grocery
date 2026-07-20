import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/feature/permission/presentation/bloc-cubit/cubit/permission_cubit.dart';
import 'package:grocery/feature/splash/presentation/screen/splash_screen.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PermissionCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: SplashScreen(),
      ),
    );
  }
}

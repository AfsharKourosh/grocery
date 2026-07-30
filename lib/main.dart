import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery/feature/app/presentation/screens/grocery_app.dart';
import 'package:grocery/feature/onBoarding/presentation/bloc-cubit/cubit/on_bording_cubit.dart';
import 'package:grocery/feature/permission/presentation/bloc-cubit/permission/permission_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PermissionCubit()),
        BlocProvider(create: (context) => OnBordingCubit()),
      ],
      child: const GroceryApp(),
    ),
  );
}

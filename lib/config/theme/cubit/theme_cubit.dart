// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'theme_state.dart';

// class ThemeCubit extends Cubit<ThemeState> {
//   ThemeCubit() : super(ThemeInitial());
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ThemeCubit extends Cubit<ThemeMode> {
//   ThemeCubit() : super(ThemeMode.system);

//   void light() => emit(ThemeMode.light);

//   void dark() => emit(ThemeMode.dark);

//   void system() => emit(ThemeMode.system);

//   void toggle() {
//     emit(
//       state == ThemeMode.dark
//           ? ThemeMode.light
//           : ThemeMode.dark,
//     );
//   }
// }
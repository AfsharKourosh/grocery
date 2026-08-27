/*
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

    void light() => emit(ThemeMode.light);

  void dark() => emit(ThemeMode.dark);
}



state of cubit in them is ThemeMode



MaterialApp(
  theme: AppTheme.light,
  darkTheme: AppTheme.dark,
  themeMode: context.watch<ThemeCubit>().state,

  locale: context.watch<LocaleCubit>().state,
  supportedLocales: AppLocalizations.supportedLocales,
  localizationsDelegates: AppLocalizations.localizationsDelegates,
);

*/

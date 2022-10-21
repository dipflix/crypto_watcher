import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

part 'theme_cubit.freezed.dart';

abstract class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(super.initialState);

  void switchTheme();
}

@LazySingleton(as: ThemeCubit)
class ThemeCubitImpl extends ThemeCubit {
  ThemeCubitImpl() : super(ThemeState(mode: ThemeMode.light));

  @override
  void switchTheme() {
    emit(
      ThemeState(
        mode: state.mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}

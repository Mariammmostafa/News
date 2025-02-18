import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  bool isDark = false;

  changeAppTheme() {
    isDark = !isDark;
    emit(MainInitial());
  }
}

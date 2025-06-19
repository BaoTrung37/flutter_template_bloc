import 'dart:async';

import 'package:example_flutter_app/core/shared/enum/lanugages.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'language_bloc.freezed.dart';
part 'language_bloc.g.dart';
part 'language_event.dart';
part 'language_state.dart';

@lazySingleton
class LanguageBloc extends HydratedBloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState.initial()) {
    on<_ChangeLanguage>(_onChangeLanguage);
    on<_ChangeTempLanguage>(_onChangeTempLanguage);
  }

  Future<void> _onChangeLanguage(
    _ChangeLanguage event,
    Emitter<LanguageState> emit,
  ) async {
    emit(state.copyWith(
      language: state.tempLanguage,
    ));
  }

  Future<void> _onChangeTempLanguage(
    _ChangeTempLanguage event,
    Emitter<LanguageState> emit,
  ) async {
    emit(state.copyWith(
      tempLanguage: event.language,
      language: event.language,
    ));
  }

  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    return LanguageState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    return state.toJson();
  }
}

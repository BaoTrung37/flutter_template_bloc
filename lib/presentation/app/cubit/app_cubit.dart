import 'package:bloc/bloc.dart';
import 'package:fortune_teller/presentation/utilities/enums/common/languages.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

@singleton
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void changeLanguage(Languages language) {
    emit(state.copyWith(currentLanguage: language));
  }
}

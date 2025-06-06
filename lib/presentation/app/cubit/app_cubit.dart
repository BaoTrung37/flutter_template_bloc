// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:example_flutter_app/config/services/local_service/shared_manager.dart';
import 'package:example_flutter_app/config/utilities/enums/common/languages.dart';
import 'package:example_flutter_app/presentation/presentation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

@lazySingleton
class AppCubit extends Cubit<AppState> {
  AppCubit(
    this.sharedManager,
  ) : super(const AppState()) {
    Future.delayed(Duration.zero, () {
      init();
    });
  }

  final SharedManager sharedManager;

  Future<void> init() async {
    emit(state.copyWith(status: AppStatus.initial));
    final currentLanguageCode = sharedManager.getLanguageCode();
    final language = Languages.values.firstWhere(
      (element) => element.languageCode == currentLanguageCode,
      orElse: () => Languages.en,
    );
    emit(
      state.copyWith(
        currentLanguage: language,
        status: AppStatus.success,
      ),
    );
  }

  Future<void> changeLanguage(Languages language) async {
    await sharedManager.saveLanguageCode(language.languageCode);
    emit(state.copyWith(currentLanguage: language));
  }
}

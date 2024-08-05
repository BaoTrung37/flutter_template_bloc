import 'package:bloc/bloc.dart';
import 'package:example_flutter_app/presentation/utilities/enums/common/app_status.dart';
import 'package:example_flutter_app/presentation/utilities/errors/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  // void navigateToHome() {
  //   try {
  //     //

  //     //
  //   } on Exception catch (e) {
  //     emit(state.copyWith(
  //       appStatus: AppStatus.error,
  //       appError: e.appError,
  //     ));
  //   }
  // }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:example_flutter_app/core/utilities/enums/common/app_status.dart';
import 'package:example_flutter_app/core/utilities/errors/app_error.dart';
import 'package:example_flutter_app/domain/use_cases/use_cases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(
    this._getFirstTimeLaunchUseCase,
  ) : super(const SplashState());

  final GetFirstTimeLaunchUseCase _getFirstTimeLaunchUseCase;

  bool get isFirstTimeLaunch {
    final result = _getFirstTimeLaunchUseCase.run();
    return result;
  }
}

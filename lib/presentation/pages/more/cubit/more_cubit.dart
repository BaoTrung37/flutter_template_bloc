import 'package:bloc/bloc.dart';
import 'package:example_flutter_app/core/utilities/enums/common/app_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'more_cubit.freezed.dart';
part 'more_state.dart';

@lazySingleton
class MoreCubit extends Cubit<MoreState> {
  MoreCubit() : super(const MoreState());
}

import 'package:example_flutter_app/core/infrastructure/services/local_service/shared_manager.dart';
import 'package:example_flutter_app/domain/use_cases/base/use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFirstTimeLaunchUseCase extends OutputUseCase<bool> {
  GetFirstTimeLaunchUseCase(this._sharedManager);

  final SharedManager _sharedManager;
  @override
  bool run() {
    return _sharedManager.getFirstTimeLaunch();
  }
}

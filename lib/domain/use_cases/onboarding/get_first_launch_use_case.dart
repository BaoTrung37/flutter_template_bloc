import 'package:example_flutter_app/core/infrastructure/services/local/shared/local_manager.dart';
import 'package:example_flutter_app/domain/use_cases/base/use_case.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFirstLaunchUseCase extends OutputUseCase<bool> {
  GetFirstLaunchUseCase(this._sharedManager);

  final SharedManager _sharedManager;
  @override
  bool run() {
    return _sharedManager.getFirstLaunch();
  }
}

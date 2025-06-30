import 'package:example_flutter_app/core/config.dart';
import 'package:example_flutter_app/domain/use_cases/base/use_case.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PostFirstLaunchUseCase extends OutputUseCase<void> {
  PostFirstLaunchUseCase(this._sharedManager);

  final SharedManager _sharedManager;
  @override
  void run() {
    _sharedManager.saveFirstLaunch();
  }
}

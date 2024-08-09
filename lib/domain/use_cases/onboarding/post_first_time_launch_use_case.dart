import 'package:example_flutter_app/data/data.dart';
import 'package:example_flutter_app/domain/use_cases/base/use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostFirstTimeLaunchUseCase extends OutputUseCase<void> {
  PostFirstTimeLaunchUseCase(this._sharedManager);

  final SharedManager _sharedManager;
  @override
  void run() {
    _sharedManager.saveFirstTimeLaunch();
  }
}

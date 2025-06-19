import 'package:example_flutter_app/data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedManager {
  SharedManager(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  ///* First Time Launch
  Future<void> saveFirstTimeLaunch() async {
    await _sharedPreferences.setBool(
      SharedKeys.firstTimeLaunch.name,
      false,
    );
  }

  bool getFirstTimeLaunch() {
    return _sharedPreferences.getBool(SharedKeys.firstTimeLaunch.name) ?? true;
  }

  Future<void> removeFirstTimeLaunch() async {
    await _sharedPreferences.remove(SharedKeys.firstTimeLaunch.name);
  }
}

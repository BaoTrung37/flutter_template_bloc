import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedManager {
  SharedManager(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  Future<void> saveString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }
}

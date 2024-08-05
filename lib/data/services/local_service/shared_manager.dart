import 'package:example_flutter_app/data/data.dart';
import 'package:example_flutter_app/presentation/utilities/enums/common/languages.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedManager {
  SharedManager(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  Future<void> saveLanguageCode(String languageCode) async {
    await _sharedPreferences.setString(
      SharedKeys.languageCode.name,
      languageCode,
    );
  }

  Future<String> getLanguageCode() async {
    return _sharedPreferences.getString(SharedKeys.languageCode.name) ??
        Languages.en.name;
  }

  Future<void> removeLanguageCode() async {
    await _sharedPreferences.remove(SharedKeys.languageCode.name);
  }
}

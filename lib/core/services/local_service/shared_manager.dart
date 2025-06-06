import 'package:example_flutter_app/core/utilities/enums/common/languages.dart';
import 'package:example_flutter_app/data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedManager {
  SharedManager(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  //* First Time Launch
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

  //* Language Code
  Future<void> saveLanguageCode(String languageCode) async {
    await _sharedPreferences.setString(
      SharedKeys.languageCode.name,
      languageCode,
    );
  }

  String getLanguageCode() {
    return _sharedPreferences.getString(SharedKeys.languageCode.name) ??
        Languages.en.name;
  }

  Future<void> removeLanguageCode() async {
    await _sharedPreferences.remove(SharedKeys.languageCode.name);
  }

  //* Access Token
  Future<void> saveAccessToken(String accessToken) async {
    await _sharedPreferences.setString(
      SharedKeys.accessToken.name,
      accessToken,
    );
  }

  String getAccessToken() {
    return _sharedPreferences.getString(SharedKeys.accessToken.name) ?? '';
  }

  Future<void> removeAccessToken() async {
    await _sharedPreferences.remove(SharedKeys.accessToken.name);
  }
}

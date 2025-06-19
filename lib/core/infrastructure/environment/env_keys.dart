import 'package:example_flutter_app/core/app_config.dart';
import 'package:example_flutter_app/gen/assets.gen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvKeys {
  Future<void> loadEnv(Flavor flavor) async {
    switch (flavor) {
      case Flavor.dev:
        await dotenv.load(fileName: Assets.env.aEnvDev);
        break;
      case Flavor.prod:
        await dotenv.load(fileName: Assets.env.aEnv);
        break;
    }
  }

  String get apiKey => dotenv.get('API_KEY');
  String get baseUrl => dotenv.get('BASE_URL');
  String get token => dotenv.get('TOKEN');
  String get reqResUrl => dotenv.get('REQRES_URL');
}

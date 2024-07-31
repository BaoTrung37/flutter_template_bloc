// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../data/services/local_service/shared_manager.dart' as _i1048;
import '../presentation/app/cubit/app_cubit.dart' as _i202;
import '../presentation/pages/main_app/cubit/bottom_tab_cubit.dart' as _i679;
import '../presentation/pages/splash/cubit/splash_cubit.dart' as _i386;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.shared,
      preResolve: true,
    );
    gh.factory<_i386.SplashCubit>(() => _i386.SplashCubit());
    gh.lazySingleton<_i202.AppCubit>(() => _i202.AppCubit());
    gh.lazySingleton<_i679.BottomTabCubit>(() => _i679.BottomTabCubit());
    gh.factory<_i1048.SharedManager>(
        () => _i1048.SharedManager(gh<_i460.SharedPreferences>()));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class MyBlocObserver extends BlocObserver {
  Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 4,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTime,
    ),
  );

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    logger.i('CREATE ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    logger.i('CLOSE ${bloc.runtimeType}');
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logger.e('ERROR', error: 'Bloc: ${bloc.runtimeType}, Error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    logger.d('TRANSITION',
        error: '${bloc.runtimeType} , Transition: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    logger.i('CHANGE', error: '${bloc.runtimeType}, Change: $change');
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    logger.d('EVENT',
        error: 'Bloc: ${bloc.runtimeType}, Event: ${event.runtimeType}');
    super.onEvent(bloc, event);
  }
}

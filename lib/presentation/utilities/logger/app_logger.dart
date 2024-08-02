import 'package:logger/logger.dart';

final lg = Logger(
  printer: PrettyPrinter(
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.dateAndTime,
  ),
);

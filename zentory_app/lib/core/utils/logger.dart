import 'package:logger/logger.dart';

class ZentoryLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
  );

  static void i(String message) => _logger.i(message);
  static void d(String message) => _logger.d(message);
  static void w(String message) => _logger.w(message);
  static void e(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  // Aliases for better readability
  static void info(String message) => i(message);
  static void debug(String message) => d(message);
  static void warning(String message) => w(message);
  static void error(String message, [dynamic error, StackTrace? stackTrace]) =>
      e(message, error, stackTrace);
}

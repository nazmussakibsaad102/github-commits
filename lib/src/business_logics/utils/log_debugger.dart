import 'package:logger/logger.dart';

class LogDebugger {
  static Logger logger = Logger();

  static Logger get instance => logger;
}
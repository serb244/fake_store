import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

enum LogLevel { debug, info, warning, error, fatal, verbose }

class MyLogger {
  final Logger _logger = Logger();
  final LogLevel logLevel = LogLevel.info;
  File? _logFile;
  String logFileName = 'log.txt';

  MyLogger() {
    _initialize();
  }

  void log({
    String? message,
    Object? error,
    LogLevel logLevel = LogLevel.info,
    StackTrace? stackTrace,
    bool writeToFile = false,
  }) {
    if (message == null && error == null && stackTrace == null) return;
    error == null ? null : message = '$message\r\n${error.toString()}';
    stackTrace == null ? null : message = '$message\r\n$stackTrace';
    switch (logLevel) {
      case LogLevel.debug:
        _logger.d(message);
        break;
      case LogLevel.info:
        _logger.i(message);
        break;
      case LogLevel.warning:
        _logger.w(message);
        break;
      case LogLevel.error:
        _logger.e(message);
        break;
      case LogLevel.fatal:
        _logger.f(message);
        break;
      case LogLevel.verbose:
        _logger.t(message);
        break;
      default:
        break;
    }
    if (writeToFile == true) {
      _writeToFile('${logLevel.name}: $message');
    }
  }

  Future<void> _initialize() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    logFileName = '${packageInfo.appName}_log.log';
    await _initializeLogFile();
  }

  Future<void> _initializeLogFile() async {
    final Directory? directory = kIsWeb ? null : await getApplicationDocumentsDirectory();
    if (directory == null) return;
    _logFile = File('${directory.path}/$logFileName');
    if (_logFile != null && _logFile is File && !_logFile!.existsSync()) {
      _logFile!.createSync();
    }
  }

  Future<void> _writeToFile(String logEntry) async {
    if (kIsWeb) return;
    if (_logFile == null) await _initializeLogFile();
    if (_logFile!.existsSync()) {
      await _logFile!.writeAsString('$logEntry\n', mode: FileMode.append);
    }
  }
}

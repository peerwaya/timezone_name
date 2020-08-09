
import 'dart:async';

import 'package:flutter/services.dart';

class TimezoneName {
  static const MethodChannel _channel =
      const MethodChannel('timezone_name');

  static Future<String> get name async {
    final String version = await _channel.invokeMethod('getTimeZoneName');
    return version;
  }
}

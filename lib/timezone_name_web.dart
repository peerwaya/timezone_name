import 'dart:async';
import 'dart:js';
// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';


/// A web implementation of the TimezoneName plugin.
class TimezoneNameWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'timezone_name',
      const StandardMethodCodec(),
      registrar.messenger,
    );

    final pluginInstance = TimezoneNameWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  /// Handles method calls over the MethodChannel of this plugin.
  /// Note: Check the "federated" architecture for a new way of doing this:
  /// https://flutter.dev/go/federated-plugins
  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'getTimeZoneName':
        return getTimeZoneName();
        break;
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'timezone_name for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  /// Returns a [String] containing the version of the platform.
  Future<String> getTimeZoneName() {
    var dateFormat = JsObject(context['Intl']['DateTimeFormat']);
    final timeZone = dateFormat.callMethod('resolvedOptions')['timeZone'];
    return Future.value(timeZone);
  }
}

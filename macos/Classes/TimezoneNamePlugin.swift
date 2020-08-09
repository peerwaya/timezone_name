import Cocoa
import FlutterMacOS

public class FLETimezoneNamePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    TimezoneNamePlugin.register(with: registrar)
  }
}

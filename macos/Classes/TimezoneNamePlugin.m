#import "TimezoneNamePlugin.h"

@implementation TimezoneNamePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"timezone_name"
            binaryMessenger:[registrar messenger]];
  TimezoneNamePlugin* instance = [[TimezoneNamePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getTimeZoneName" isEqualToString:call.method]) {
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    NSString *tzName = [timeZone name];
    result(tzName);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end

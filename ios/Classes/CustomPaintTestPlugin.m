#import "CustomPaintTestPlugin.h"
#if __has_include(<custom_paint_test/custom_paint_test-Swift.h>)
#import <custom_paint_test/custom_paint_test-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "custom_paint_test-Swift.h"
#endif

@implementation CustomPaintTestPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCustomPaintTestPlugin registerWithRegistrar:registrar];
}
@end

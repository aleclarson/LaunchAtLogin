#import <AppKit/AppKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
	NSString *helperId = NSBundle.mainBundle.bundleIdentifier;
	NSString *bundleId = [helperId substringToIndex:@"-LaunchAtLoginHelper".length];
	
	if ([NSRunningApplication runningApplicationsWithBundleIdentifier:bundleId].count == 0) {
		NSArray<NSString *> *parts = NSBundle.mainBundle.bundlePath.pathComponents;
		NSString *mainPath = [NSString pathWithComponents:[parts subarrayWithRange:(NSRange){0, parts.count - 5}]];
		[NSWorkspace.sharedWorkspace launchApplication:mainPath];
	}
	
	[NSApp terminate:nil];
}

@end

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSApplication *app = [NSApplication sharedApplication];
    AppDelegate *delegate = [AppDelegate new];
    app.delegate = delegate;
    [app run];
  }
}

#import <AppKit/AppKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
	NSString *helperId = NSBundle.mainBundle.bundleIdentifier;
	NSLog(@"helperId => %@", helperId);
	
	NSString *bundleId = [helperId substringToIndex:helperId.length - @"-LaunchAtLoginHelper".length];
	NSLog(@"bundleId => %@", bundleId);
	
	NSArray *running = [NSRunningApplication runningApplicationsWithBundleIdentifier:bundleId];
	NSLog(@"isRunning => %@", running.count > 0 ? @"YES" : @"NO");
	
	if (running.count == 0) {
		NSArray<NSString *> *parts = NSBundle.mainBundle.bundlePath.pathComponents;
		NSLog(@"helperPathComponents => %@", parts);
		
		NSString *mainPath = [NSString pathWithComponents:[parts subarrayWithRange:(NSRange){0, parts.count - 4}]];
		NSLog(@"Launching: %@", mainPath);
		
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

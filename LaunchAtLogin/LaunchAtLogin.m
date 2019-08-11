#import "LaunchAtLogin.h"
#import <Foundation/Foundation.h>
#import <ServiceManagement/ServiceManagement.h>

@implementation LaunchAtLogin

+ (CFStringRef)identifier
{
	return (__bridge CFStringRef)[NSBundle.mainBundle.bundleIdentifier stringByAppendingString:@"-LaunchAtLoginHelper"];
}

+ (BOOL)isEnabled
{
	BOOL enabled = [[NSUserDefaults standardUserDefaults] boolForKey:@"launchAtLogin"];
	return SMLoginItemSetEnabled(self.identifier, enabled) ? enabled : NO;
}

+ (void)setEnabled:(BOOL)enabled
{
	if (SMLoginItemSetEnabled(self.identifier, enabled)) {
		[[NSUserDefaults standardUserDefaults] setBool:enabled forKey:@"launchAtLogin"];
	}
}

@end

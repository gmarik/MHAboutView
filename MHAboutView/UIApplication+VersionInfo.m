//
//  UIApplication+VersionInfo.m
//  MHAboutView
//
//  Created by Maryan Hratson on 2013-06-30.
//  Copyright (c) 2013 Maryan Hratson. All rights reserved.
//

#import "UIApplication+VersionInfo.h"
#import <sys/utsname.h>

// idea from http://stackoverflow.com/a/7608711/320273
@implementation UIApplication (VersionInfo)

+ (NSString *) versionBuild
{
    NSString * versionString = [NSString stringWithFormat: @"v%@", self.appVersion];

    if (![self.appVersion isEqualToString: self.build]) {
        return [NSString stringWithFormat: @"%@(%@)", versionString, self.build];
    } else {
        return versionString;
    }
}

+(NSString *) bundleName
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
}

+ (NSString *) appVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
}

+(NSString *) versionFull {
    return [NSString stringWithFormat:@"%@-%@", [self bundleName], [self versionBuild]];
}

+ (NSString *) build
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey];
}

// belongs to UIDevice
// from http://stackoverflow.com/a/1108927/320273
+(NSString*) machineName
{
    struct utsname systemInfo;
    uname(&systemInfo);

    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}

@end

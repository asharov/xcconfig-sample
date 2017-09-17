//
//  NSBundle+UrlAccess.m
//  xcconfig-sample
//

#import "NSBundle+UrlAccess.h"

@implementation NSBundle (UrlAccess)

- (NSString *)fut_urlForInfoDictionaryKey:(NSString *)key
{
    NSString *value = [self objectForInfoDictionaryKey:key];
    return [value stringByReplacingOccurrencesOfString:@"/ /" withString:@"//"];
}

@end

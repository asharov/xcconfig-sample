//
//  NSBundle+UrlAccess.m
//  xcconfig-sample
//
//  Created by Jaakko Kangasharju on 04.07.17.
//  Copyright © 2017 Futurice. All rights reserved.
//

#import "NSBundle+UrlAccess.h"

@implementation NSBundle (UrlAccess)

- (NSString *)fut_urlForInfoDictionaryKey:(NSString *)key
{
    NSString *value = [self objectForInfoDictionaryKey:key];
    return [value stringByReplacingOccurrencesOfString:@"/ /" withString:@"//"];
}

@end

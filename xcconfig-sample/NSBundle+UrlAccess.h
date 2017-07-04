//
//  NSBundle+UrlAccess.h
//  xcconfig-sample
//
//  Created by Jaakko Kangasharju on 04.07.17.
//  Copyright © 2017 Futurice. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (UrlAccess)

- (nullable NSString *)fut_urlForInfoDictionaryKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END

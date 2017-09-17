//
//  NSBundle+UrlAccess.h
//  xcconfig-sample
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (UrlAccess)

- (nullable NSString *)fut_urlForInfoDictionaryKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END

//
//  NSString+CHTPassword.m
//  CHTCategoryDemo
//
//  Created by cht on 16/9/24.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import "NSString+CHTPassword.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (CHTPassword)


/**
 32位md5加密

 @return 加密后的字符串
 */
- (NSString *)md5{
    
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, (CC_LONG)StrLength(cStr), digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i ++) {
        
        [result appendFormat:@"%02x",digest[i]];
    }
    return result.copy;
}


/**
 SHA1加密

 @return 加密后的字符串
 */
- (NSString *)sha1{
    
    const char *cStr = [self UTF8String];
    NSData *data = [NSData dataWithBytes:cStr length:self.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.bytes, digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i ++) {
        
        [result appendFormat:@"%02x",digest[i]];
    }
    
    return result.copy;
}


@end

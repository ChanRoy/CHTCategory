//
//  NSString+CHTPassword.h
//  CHTCategoryDemo
//
//  Created by cht on 16/9/24.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CHTPassword)

/**
 32位md5加密
 
 @return 加密后的字符串
 */
- (NSString *)md5;

/**
 SHA1加密
 
 @return 加密后的字符串
 */
- (NSString *)sha1;

@end

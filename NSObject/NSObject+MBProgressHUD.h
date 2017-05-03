//
//  NSObject+MBProgressHUD.h
//  QFangWangHK
//
//  Created by cht on 2017/5/3.
//  Copyright © 2017年 qfangwanghk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface NSObject (MBProgressHUD)

- (void)startLoading:(UIView *)view text:(NSString *)text;

- (void)stopLoading;

- (void)showToastText:(NSString *)text;

- (void)showToastText:(NSString *)text afterDelay:(NSTimeInterval)delay;

@end

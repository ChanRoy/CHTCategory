//
//  UIViewController+MBProgressHUD.h
//  CHTGithub
//
//  Created by cht on 17/3/26.
//  Copyright © 2017年 cht. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIViewController (MBProgressHUD)

- (void)startLoading:(UIView *)view text:(NSString *)text;

- (void)stopLoading;

- (void)showToastText:(NSString *)text;

- (void)showToastText:(NSString *)text afterDelay:(NSTimeInterval)delay;

@end

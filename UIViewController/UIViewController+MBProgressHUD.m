//
//  UIViewController+MBProgressHUD.m
//  CHTGithub
//
//  Created by cht on 17/3/26.
//  Copyright © 2017年 cht. All rights reserved.
//

#import "UIViewController+MBProgressHUD.h"
#import <objc/runtime.h>

#define kHUDDelay 0.7

@interface UIViewController ()<MBProgressHUDDelegate>

@property (nonatomic, copy) MBProgressHUD *hud;

@end

@implementation UIViewController (MBProgressHUD)

- (void)setHud:(MBProgressHUD *)hud{
    
    objc_setAssociatedObject(self, @selector(hud), hud, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (MBProgressHUD *)hud{
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)startLoading:(UIView *)view text:(NSString *)text{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.removeFromSuperViewOnHide = YES;
    hud.label.text = text;
    self.hud = hud;
}

- (void)stopLoading{
    
    [self.hud hideAnimated:YES];
}

- (void)showToastText:(NSString *)text{
    
    UIView *view = [UIApplication sharedApplication].keyWindow;
    [self showMessag:text toView:view afterDelay:kHUDDelay];
}

- (void)showToastText:(NSString *)text afterDelay:(NSTimeInterval)delay{
    
    UIView *view = [UIApplication sharedApplication].keyWindow;
    [self showMessag:text toView:view afterDelay:delay];
}

- (void)showMessag:(NSString *)message toView:(UIView *)view afterDelay:(NSTimeInterval)delay{
    
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = MBProgressHUDModeText;
    hud.label.font = [UIFont systemFontOfSize:15];
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:delay];
    self.hud = hud;
}

#pragma mark - MBProgressHUDDelegate
- (void)hudWasHidden:(MBProgressHUD *)hud{
    
    if (self.hud == hud) {
        
        self.hud.delegate = nil;
        self.hud = nil;
    }
}


@end

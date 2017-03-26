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

static NSString *const kAssociatedKey = @"kAssociatedKey";

@interface UIViewController ()<MBProgressHUDDelegate>

@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation UIViewController (MBProgressHUD)

- (void)setHud:(MBProgressHUD *)hud{
    
    objc_setAssociatedObject(self, &kAssociatedKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MBProgressHUD *)hud{
    
    return objc_getAssociatedObject(self, &kAssociatedKey);
}


- (void)startLoading:(UIView *)view text:(NSString *)text{
    
    self.hud = [[MBProgressHUD alloc] initWithView:view];
    self.hud.delegate = self;
    self.hud.labelText = text;
    [view addSubview:self.hud];
    [self.hud show:YES];
}

- (void)stopLoading{
    
    [self.hud hide:YES];
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
    
    self.hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    self.hud.delegate = self;
    self.hud.mode = MBProgressHUDModeText;
    self.hud.detailsLabelFont = [UIFont systemFontOfSize:15];
    self.hud.detailsLabelText = message;
    [self.hud hide:YES afterDelay:delay];
    self.hud.removeFromSuperViewOnHide = YES;
}

#pragma mark - MBProgressHUDDelegate
- (void)hudWasHidden:(MBProgressHUD *)hud{
    
    if (self.hud == hud) {
        
        self.hud.delegate = nil;
        [self.hud removeFromSuperview];
        self.hud = nil;
    }
}


@end

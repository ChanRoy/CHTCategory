//
//  NSObject+MBProgressHUD.m
//  QFangWangHK
//
//  Created by cht on 2017/5/3.
//  Copyright © 2017年 qfangwanghk. All rights reserved.
//

#import "NSObject+MBProgressHUD.h"
#import <objc/runtime.h>

#define kHUDDelay 0.7

@interface NSObject ()<MBProgressHUDDelegate>

@property (nonatomic, copy) MBProgressHUD *hud;

@end

@implementation NSObject (MBProgressHUD)

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
    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
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

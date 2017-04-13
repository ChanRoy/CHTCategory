//
//  UIViewController+SVProgressHUD.m
//  CHTGithub
//
//  Created by cht on 17/3/26.
//  Copyright © 2017年 cht. All rights reserved.
//

#import "UIViewController+SVProgressHUD.h"
#import "SVProgressHUD.h"

@implementation UIViewController (SVProgressHUD)

- (void)showAsyncToastText:(NSString *)text{
    
    [SVProgressHUD setInfoImage:nil];
    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD showInfoWithStatus:text];
}

- (void)dismisAsyncToastText {
    [SVProgressHUD dismiss];
}

@end

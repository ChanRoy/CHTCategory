//
//  UIViewController+SVProgressHUD.h
//  CHTGithub
//
//  Created by cht on 17/3/26.
//  Copyright © 2017年 cht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SVProgressHUD)

- (void)showAsyncToastText:(NSString *)text;

- (void)dismisAsyncToastText;

@end

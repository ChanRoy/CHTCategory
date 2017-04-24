//
//  UIImageView+CHTScrollIndicator.h
//  CHTGithub
//
//  Created by cht on 2017/4/24.
//  Copyright © 2017年 cht. All rights reserved.
//

#import <UIKit/UIKit.h>

#define noDisableVerticalScrollTag 100
#define noDisableHorizontalScrollTag 101

/**
 UIScrollView scroll indicator always visible
 reference: http://stackoverflow.com/questions/1888647/uiscrollview-showing-the-scroll-bar
 fix bug: http://stackoverflow.com/questions/20855176/images-not-showing-up-when-architecture-set-to-64-bit/20944188#20944188
 */
@interface UIImageView (CHTScrollIndicator)

@end

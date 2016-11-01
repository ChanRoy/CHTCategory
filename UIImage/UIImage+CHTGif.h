//
//  UIImage+CHTGif.h
//  CHTCategoryDemo
//
//  Created by cht on 16/9/25.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CHTGif)

//用一个Gif生成UIImage，传入一个GIFData
+ (UIImage *)animatedImageWithAnimatedGIFData:(NSData *)data;

//用一个Gif生成UIImage，传入一个GIF路径 
+ (UIImage *)animatedImageWithAnimatedGIFURL:(NSURL *)url;

@end

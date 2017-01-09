//
//  NSNull+CHTNullSafe.h
//  CHTGithub
//
//  Created by cht on 17/1/6.
//  Copyright © 2017年 cht. All rights reserved.
//

//reference:https://github.com/nicklockwood/NullSafe
//reference:http://blog.csdn.net/devday/article/details/7418022


/**
 通过消息转发解决向NSNull发送消息导致Crash，只需将两个文件导入项目中即可
 */
#import <Foundation/Foundation.h>

@interface NSNull (CHTNullSafe)


@end

//
//  NSMutableArray+CHTStack.h
//  CHTGithub
//
//  Created by cht on 17/1/9.
//  Copyright © 2017年 cht. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 基于NSMutableArray实现栈的数据结构
 */
@interface NSMutableArray (CHTStack)

//入栈
- (void)pushAnObject:(id)obj;

//出栈
- (id)popObject;

//获取栈顶
- (id)peekObject;

@end

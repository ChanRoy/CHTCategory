//
//  NSMutableDictionary+CHTWeakReference.h
//  CHTGithub
//
//  Created by cht on 2017/2/13.
//  Copyright © 2017年 cht. All rights reserved.
//

/*
弱引用容器是指基于NSArray, NSDictionary, NSSet的容器类, 该容器与这些类最大的区别在于, 将对象放入容器中并不会改变对象的引用计数器, 同时容器是以一个弱引用指针指向这个对象, 当对象销毁时自动从容器中删除, 无需额外的操作.

目前常用的弱引用容器的实现方式是block封装解封

利用block封装一个对象, 且block中对象的持有操作是一个弱引用指针. 而后将block当做对象放入容器中. 容器直接持有block, 而不直接持有对象. 取对象时解包block即可得到对应对象.
 */

//弱引用可变字典，reference: https://github.com/Magic-Unique/HXImage/blob/master/description.md
#import <Foundation/Foundation.h>

@interface NSMutableDictionary (CHTWeakReference)


- (void)weak_setObject:(id)anObject forKey:(NSString *)akey;

- (void)weak_setObjectsWithDictionary:(NSDictionary *)dict;

- (id)weak_getObjectForKey:(NSString *)akey;

@end

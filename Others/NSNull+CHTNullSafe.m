//
//  NSNull+CHTNullSafe.m
//  CHTGithub
//
//  Created by cht on 17/1/6.
//  Copyright © 2017年 cht. All rights reserved.
//

#import "NSNull+CHTNullSafe.h"
#import <objc/runtime.h>

#ifndef NULLSAFE_ENABLED
#define NULLSAFE_ENABLED 1
#endif

#pragma GCC diagnostic ingnored "-Wgnu-conditional-omitted-operand"

@implementation NSNull (CHTNullSafe)

#if NULLSAFE_ENABLED


/**
   如果实例本身就有相应的response,那么就会响应。
   如果没有系统就会发出methodSignatureForSelector消息，寻问它这个消息是否有效？
   有效就返回对应的方法地址之类的，无效则返回nil。
   如果是nil就会crash， 如果不是nil接着发送forwardInvocation消息。
 
   在forwardInvocation方法中，将target置为nil。

 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    
    //lock
    @synchronized ([self class]) {
        //look up method signature
        NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
        if (!signature) {
            //not supported by NSNull, search other classes
            static NSMutableSet *classList = nil;
            static NSMutableDictionary *signatureCache = nil;
            
            if (signatureCache == nil) {
                
                classList = [[NSMutableSet alloc]init];
                signatureCache = [[NSMutableDictionary alloc]init];
                
                //get class list
                int numClasses = objc_getClassList(NULL, 0);
                Class *classes = (Class *)malloc(sizeof(Class) * (unsigned long)numClasses);
                numClasses = objc_getClassList(classes, numClasses);
                
                //add to list for checking
                NSMutableSet *excluded = [NSMutableSet set];
                for (int i = 0; i < numClasses; i ++) {
                    //determine if class has a superclass
                    Class someClass = classes[i];
                    Class superclass = class_getSuperclass(someClass);
                    while (superclass) {
                        if (superclass == [NSObject class]) {
                            [classList addObject:someClass];
                            break;
                        }
                        [excluded addObject:NSStringFromClass(superclass)];
                        superclass = class_getSuperclass(superclass);
                    }
                }
                
                //remove all classes that have subclasses
                for (Class someClass in excluded) {
                    [classList removeObject:someClass];
                }
                
                //free class list
                free(classes);
            }
            
            //check implementation cache first
            NSString *selectorString = NSStringFromSelector(aSelector);
            signature = signatureCache[selectorString];
            if (!signature) {
                //find implementation
                for (Class someClass in classList) {
                    if ([someClass instancesRespondToSelector:aSelector]) {
                        signature = [someClass instanceMethodSignatureForSelector:aSelector];
                        break;
                    }
                }
                
                //cache for next time
                signatureCache[selectorString] = signature ?:[NSNull null];
            }else if ([signature isKindOfClass:[NSNull class]]){
                
                signature = nil;
            }
        }
        return signature;
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    
    anInvocation.target = nil;
    [anInvocation invoke];
}

#endif

@end



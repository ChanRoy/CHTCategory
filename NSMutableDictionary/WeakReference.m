//
//  WeakReference.m
//  CHTGithub
//
//  Created by cht on 2017/2/13.
//  Copyright © 2017年 cht. All rights reserved.
//

#import "WeakReference.h"

WeakReference makeWeakReference(id object) {
    __weak id weakref = object;
    return ^{
        return weakref;
    };
}

id weakReferenceNonretainedObjectValue(WeakReference ref) {
    return ref ? ref() : nil;
}

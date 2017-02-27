//
//  NSMutableDictionary+CHTWeakReference.m
//  CHTGithub
//
//  Created by cht on 2017/2/13.
//  Copyright © 2017年 cht. All rights reserved.
//



#import "NSMutableDictionary+CHTWeakReference.h"
#import "WeakReference.h"

@implementation NSMutableDictionary (CHTWeakReference)

- (void)weak_setObject:(id)anObject forKey:(NSString *)akey{
    
    [self setObject:makeWeakReference(anObject) forKey:akey];
}

- (void)weak_setObjectsWithDictionary:(NSDictionary *)dict{
    
    for (NSString *key in dict.allKeys) {
        [self setObject:makeWeakReference(dict[key]) forKey:key];
    }
}

- (id)weak_getObjectForKey:(NSString *)akey{

    return weakReferenceNonretainedObjectValue(self[akey]);
}


@end

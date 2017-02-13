//
//  WeakReference.h
//  CHTGithub
//
//  Created by cht on 2017/2/13.
//  Copyright © 2017年 cht. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef id (^WeakReference)(void);

WeakReference makeWeakReference(id object);

id weakReferenceNonretainedObjectValue(WeakReference ref);

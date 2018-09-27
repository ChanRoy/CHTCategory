//
//  UIDevice+CHTAdd.h
//  UIDevice
//
//  Created by Roy on 2018/9/27.
//  Copyright © 2018 Roy. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (CHTAdd)

// https://www.theiphonewiki.com/wiki/Models
@property (nullable, nonatomic, readonly) NSString *aps_machineModelName;

@end

NS_ASSUME_NONNULL_END

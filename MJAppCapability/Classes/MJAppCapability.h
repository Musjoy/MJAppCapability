//
//  MJAppCapability.h
//  Common
//
//  Created by 黄磊 on 2017/6/19.
//  Copyright © 2017年 Musjoy. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef FILE_NAME_APP_CAPABILITY
#define FILE_NAME_APP_CAPABILITY    @"app_capability"
#endif

@interface MJAppCapability : NSObject

+ (BOOL)haveAbilityOf:(NSString *)action;

@end

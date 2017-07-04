//
//  MJAppCapability.m
//  Common
//
//  Created by 黄磊 on 2017/6/19.
//  Copyright © 2017年 Musjoy. All rights reserved.
//

#import "MJAppCapability.h"
#import HEADER_FILE_SOURCE

@interface MJAppCapability ()

@property (nonatomic, strong) NSMutableDictionary *dicAbility;

@end

@implementation MJAppCapability


+ (id)sharedInstance
{
    static MJAppCapability *s_appCapability = nil;
    static dispatch_once_t once_patch;
    dispatch_once(&once_patch, ^() {
        s_appCapability = [[MJAppCapability alloc] init];
    });
    return s_appCapability;
}


- (id)init
{
    self = [super init];
    if (self) {
        [self reloadData];
#ifdef MODULE_FILE_SOURCE
        [FileSource observeFiles:@[FILE_NAME_APP_CAPABILITY] whileUpdate:^{
            [self reloadData];
        }];
#endif
    }
    return self;
}

+ (BOOL)haveAbilityOf:(NSString *)action
{
    return [[[[self sharedInstance] dicAbility] objectForKey:action] boolValue];
}

- (void)reloadData
{
    _dicAbility = [getFileData(FILE_NAME_APP_CAPABILITY) mutableCopy];
    if (_dicAbility == nil) {
        _dicAbility = [[NSMutableDictionary alloc] init];
    }
}

@end

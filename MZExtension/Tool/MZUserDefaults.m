//
//  MZUserDefaults.m
//  StudyDemo
//
//  Created by 曾龙 on 2019/9/26.
//  Copyright © 2019 曾龙. All rights reserved.
//

#import "MZUserDefaults.h"

@implementation MZUserDefaults
/// 存储数据到本地
/// @param data 要存储的数据
/// @param key 存储数据对应的key
+ (void)saveData:(id)data ForKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:key];
    [defaults synchronize];
}

/// 获取本地存储的数据
/// @param key 存储数据对应的key
+ (id)getDataForKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults valueForKey:key];
    if (data) {
        return [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    return nil;
}
@end

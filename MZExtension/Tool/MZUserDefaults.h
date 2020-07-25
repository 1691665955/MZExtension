//
//  MZUserDefaults.h
//  StudyDemo
//
//  Created by 曾龙 on 2019/9/26.
//  Copyright © 2019 曾龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZUserDefaults : NSObject

/// 存储数据到本地
/// @param data 要存储的数据
/// @param key 存储数据对应的key
+ (void)saveData:(id)data ForKey:(NSString *)key;

/// 获取本地存储的数据
/// @param key 存储数据对应的key
+ (id)getDataForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END

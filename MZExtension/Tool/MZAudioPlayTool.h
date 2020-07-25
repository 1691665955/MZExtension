//
//  MZAudioPlayTool.h
//  StudyDemo
//
//  Created by 曾龙 on 2019/5/31.
//  Copyright © 2019 曾龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZAudioPlayTool : NSObject

/**
 播放自定义声音，不超过30s

 @param name 音频文件名称,带后缀
 */
+ (void)playAudioWithName:(NSString *)name;

/**
 震动
 */
+ (void)vibrate;
@end

NS_ASSUME_NONNULL_END

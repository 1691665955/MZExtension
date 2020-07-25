//
//  MZAudioPlayTool.m
//  StudyDemo
//
//  Created by 曾龙 on 2019/5/31.
//  Copyright © 2019 曾龙. All rights reserved.
//

#import "MZAudioPlayTool.h"
#import <AVFoundation/AVFoundation.h>

@implementation MZAudioPlayTool
+ (void)playAudioWithName:(NSString *)name {
    NSString *urlPath = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:urlPath];
    SystemSoundID ID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &ID);
    AudioServicesPlaySystemSound(ID);
}

+ (void)vibrate {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end

//
//  NSObject+TDTool.h
//  TDEntranceGuard
//
//  Created by 曾龙 on 2018/6/12.
//  Copyright © 2018年 farbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (TDTool)
+ (UIViewController *)currentViewController;
- (NSString *)deleteTheUnuseZero:(NSString *)string;
- (void)gotoRootViewController;
- (void)gotoLoginViewController;
@end

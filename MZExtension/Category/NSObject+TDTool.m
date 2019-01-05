//
//  NSObject+TDTool.m
//  TDEntranceGuard
//
//  Created by 曾龙 on 2018/6/12.
//  Copyright © 2018年 farbell. All rights reserved.
//

#import "NSObject+TDTool.h"
#import "TDTabBarController.h"
#import "MZNavigationController.h"
#import "TDLoginVC.h"
#import "AppDelegate.h"
#import "TDMainPageVC.h"
#import "TDPersonVC.h"

#import "XGPush.h"

@implementation NSObject (TDTool)
//获取当前屏幕显示的viewcontroller
+ (UIViewController *)currentViewController
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        
        return [self getCurrentVCFrom:[rootVC presentedViewController]];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        // 根视图为非导航类
        
        currentVC = rootVC;
    }
    
    return currentVC;
}

- (NSString *)deleteTheUnuseZero:(NSString *)string {
    NSString *newString = [NSString stringWithFormat:@"%.2lf",string.floatValue];
    if ([newString hasSuffix:@".00"]) {
        return [newString substringToIndex:newString.length-3];
    } else if ([newString hasSuffix:@"0"]) {
        return [newString substringToIndex:newString.length-1];
    }
    return newString;
}

- (void)gotoRootViewController {
    if ([NSObject currentViewController].presentingViewController) {
        TDTabBarController *vc = (TDTabBarController *)[NSObject currentViewController].presentingViewController;
        [vc.selectedViewController popToRootViewControllerAnimated:YES];
        if (vc.selectedIndex == 0) {
            TDPersonVC *personVC = (TDPersonVC *)vc.viewControllers.lastObject.childViewControllers.firstObject;
            [personVC loadData];
        } else {
            TDPersonVC *personVC = (TDPersonVC *)vc.selectedViewController.childViewControllers.firstObject;
            [personVC loadData];
            vc.selectedIndex = 0;
        }
        TDMainPageVC *mainPage = (TDMainPageVC *)vc.selectedViewController.childViewControllers.firstObject;
        [mainPage loadData];
        [[NSObject currentViewController] dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    TDTabBarController *vc = [[TDTabBarController alloc] init];
    [[NSObject currentViewController] presentViewController:vc animated:YES completion:nil];
}

- (void)gotoLoginViewController {
    [[IMAPlatform sharedInstance] logout:^{
        
    } fail:^(int code, NSString *msg) {
        
    }];
    
    [[XGPushTokenManager defaultTokenManager] clearAllIdentifiers:XGPushTokenBindTypeAccount];
    [[XGPush defaultManager] stopXGNotification];
    
    MZNavigationController *nvc = [[MZNavigationController alloc] initWithRootViewController:[[TDLoginVC alloc] init]];
    [[NSObject currentViewController] presentViewController:nvc animated:YES completion:nil];
}
@end

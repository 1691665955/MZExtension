//
//  baseHeader.h
//  SmartFan
//
//  Created by 曾龙 on 2018/11/2.
//  Copyright © 2018年 trudian. All rights reserved.
//

#ifndef baseHeader_h
#define baseHeader_h

#define RGB(r,g,b)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

//适配iPhoneX
#define iphoneX      [UIScreen mainScreen].bounds.size.height >= 812.0
#define StatusBar_Height [UIApplication sharedApplication].statusBarFrame.size.height
#define Navi_Height  ([UINavigationController new].navigationBar.frame.size.height + StatusBar_Height)
#define Safe_Bottom  (iphoneX?34.0:0.0)
#define Tabbar_Height ([UITabBarController new].tabBar.frame.size.height + Safe_Bottom)

// 弱引用
#define WeakSelf(type)       __weak typeof(type) weak##type = type;
// 强引用
#define StrongSelf(type)     __strong typeof(type) type = weak##type;

// 解决iOS11 automaticallyAdjustsScrollViewInsets失效
#define  adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView   performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)

#if DEBUG
#define NSLog(...) NSLog(@"\n 在文件(%@)第(%d)行\n %@\n",[[NSString stringWithFormat:@"%s",__FILE__] componentsSeparatedByString:@"/"].lastObject,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...) nil
#endif

#endif /* baseHeader_h */

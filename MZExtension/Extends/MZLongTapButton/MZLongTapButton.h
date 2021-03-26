//
//  MZLongTapButton.h
//  MVVMDemo
//
//  Created by 曾龙 on 2021/3/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 长按执行，类似购物车数量按钮，长按连续增加
@interface MZLongTapButton : UIButton
@property (nonatomic, assign) NSTimeInterval timeStart;                     //长按起始时间
@property (nonatomic, assign) NSTimeInterval timeGap;                       //长按时间间隔
@property (nonatomic, copy) void (^tapCallback)(MZLongTapButton *sender);   //长按会调

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnullability"
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents NS_UNAVAILABLE;
#pragma clang diagnostic pop
@end

NS_ASSUME_NONNULL_END

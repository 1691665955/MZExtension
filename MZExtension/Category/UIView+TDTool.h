//
//  UIView+TDTool.h
//  TDEntranceGuard
//
//  Created by 曾龙 on 2018/6/1.
//  Copyright © 2018年 farbell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TDTool)

/**
 设置试图背景颜色的渐变色

 @param startColor 起始颜色
 @param endColor 终止颜色
 @param startPoint 起始位置
 @param endPoint 终止位置
 */
- (void)setupGradientColorWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;


/**
 根据一个VC上的view得到该VC
 
 @return VC
 */
- (UIViewController *)getVC;
@end

//
//  UIView+TDTool.m
//  TDEntranceGuard
//
//  Created by 曾龙 on 2018/6/1.
//  Copyright © 2018年 farbell. All rights reserved.
//

#import "UIView+TDTool.h"

@implementation UIView (TDTool)
- (void)setupGradientColorWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    if (self.layer.sublayers.count > 0 && [self.layer.sublayers[0] isKindOfClass:[CAGradientLayer class]]) {
        [self.layer.sublayers[0] removeFromSuperlayer];
    }
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.startPoint = startPoint;
    gradient.endPoint = endPoint;
    gradient.frame = self.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)startColor.CGColor, (id)endColor.CGColor, nil];
    [self.layer insertSublayer:gradient atIndex:0];
}

/**
 根据一个VC上的view得到该VC
 
 @return VC
 */
- (UIViewController *)getVC {
    UIResponder *responder = self;
    while ((responder = [responder nextResponder])) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
    }
    return nil;
}
@end

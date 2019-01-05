//
//  UIButton+TDTouch.m
//  SmartApartment
//
//  Created by 曾龙 on 2018/7/20.
//  Copyright © 2018年 trudian. All rights reserved.
//

#import "UIButton+TDTouch.h"
#import<objc/runtime.h>

#define defaultInterval  0.5f

@implementation UIButton (TDTouch)
static const char *UIControl_eventTimeInterval = "UIControl_eventTimeInterval";
- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    self.enabled = NO;
    [self performSelector:@selector(changeEnable) withObject:nil afterDelay:self.eventTimeInterval > 0 ? self.eventTimeInterval : defaultInterval];
    [super sendAction:action to:target forEvent:event];
}

- (void)changeEnable {
    self.enabled = YES;
}

- (NSTimeInterval)eventTimeInterval {
    return [objc_getAssociatedObject(self, UIControl_eventTimeInterval) doubleValue];
}

- (void)setEventTimeInterval:(NSTimeInterval)eventTimeInterval {
    objc_setAssociatedObject(self, UIControl_eventTimeInterval, @(eventTimeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
